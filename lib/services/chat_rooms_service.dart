import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialize/models/chat_room.dart';
import 'package:socialize/models/message_model.dart';
import 'package:socialize/repositories/chat_rooms_repository.dart';

class ChatRoomsService {
  final _chatRoomsRepository = ChatRoomsRepository();

  Stream<QuerySnapshot<Object?>> getchatRoomsStream(String currentUserId) {
    return _chatRoomsRepository
        .getChatRooms()
        .where('usersID', arrayContains: currentUserId).snapshots();
  }

  Future<QuerySnapshot<Object?>> checkChatRoomExists(
      String currentUserId) async {
    return _chatRoomsRepository
        .getChatRooms()
        .where('usersID', arrayContains: currentUserId)
        .get();
  }

  Future<String> createChatRoom(ChatRoomModel chatRoom) async {
    return await _chatRoomsRepository
        .createChatRoom(chatRoom.toJson())
        .then((newChatRoom) {
      newChatRoom.collection('messages').doc('empty').set({});
      return newChatRoom.id;
    });
  }

  Stream<QuerySnapshot<Object?>> getMessagesStream(String chatRoomID) {
    return _chatRoomsRepository
        .getMessages(chatRoomID)
        .where(FieldPath.documentId, isNotEqualTo: 'empty')
        .snapshots();
  }

  Future<void> sendMessage(String chatRoomID, MessageModel message) {
    return _chatRoomsRepository.getMessages(chatRoomID).add(message.toJson());
  }
}
