import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:socialize/models/chat_room.dart';
import 'package:socialize/models/message_model.dart';
import 'package:socialize/services/chat_rooms_service.dart';
import 'package:socialize/stores/user_store.dart';

part 'chat_rooms_store.g.dart';

// ignore: library_private_types_in_public_api
class ChatRoomsStore = _ChatRoomsStoreBase with _$ChatRoomsStore;

abstract class _ChatRoomsStoreBase with Store {
  final _chatRoomsService = ChatRoomsService();
  final _userStore = GetIt.I.get<UserStore>();

  @observable
  List<MessageModel> messages = [];

  @observable
  String currentChatRoomId = '', message = '';

  @observable
  TextEditingController messageController = TextEditingController();

  @action
  void setMessage(String value) => message = value.trim();

  @action
  void pressedSendMessage() {
    if (message.isNotEmpty) {
      _chatRoomsService.sendMessage(
          currentChatRoomId,
          MessageModel.fromJson({
            'content': message,
            'senderID': _userStore.user!.id,
            'sendedAt': Timestamp.now(),
          }));
      message = '';
      messageController.clear();
    }
  }

  @action
  Future<void> loadChatRoom(String contactID) async {
    await _chatRoomsService
        .checkChatRoomExists(_userStore.user!.id)
        .then((value) async {
      var chat = value.docs.where((e) => e.get('usersID').contains(contactID));

      if (chat.isNotEmpty) {
        currentChatRoomId = chat.first.id;
      } else {
        await createChatRoom(contactID);
      }
    });
  }

  @action
  Future<void> createChatRoom(String contactID) async {
    currentChatRoomId =
        await _chatRoomsService.createChatRoom(ChatRoomModel.fromJson({
      'usersID': [_userStore.user!.id, contactID],
      'type': 'user',
      'groupID': null,
    }));
  }

  @action
  void getMessagesStream() {
    _chatRoomsService.getMessagesStream(currentChatRoomId).listen((snapshot) {
      messages = snapshot.docs
          .map((e) => MessageModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      messages.sort((a, b) => b.sendedAt.compareTo(a.sendedAt));
    });
  }
}
