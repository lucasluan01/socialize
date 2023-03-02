import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:socialize/auth/auth_service.dart';

part 'chat_store.g.dart';

// ignore: library_private_types_in_public_api
class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  final authService = GetIt.instance<AuthService>();

  @observable
  List<QueryDocumentSnapshot> messages = [];

  @observable
  TextEditingController messageController = TextEditingController();

  @observable
  String? idChat;

  @observable
  String message = '';

  @action
  void setMessage(String value) => message = value.trim();

  @computed
  DocumentReference<Map<String, dynamic>> get chatRoom =>
      FirebaseFirestore.instance.collection('chat_rooms').doc(idChat);

  @action
  void setIdChat(String? value) => idChat = value;

  @action
  void listenToChatMessages() {
    chatRoom
        .collection('messages')
        .where(FieldPath.documentId, isNotEqualTo: 'empty')
        .snapshots()
        .listen((snapshot) {
      messages = snapshot.docs;
      messages.sort((a, b) => b['shippingDate'].compareTo(a['shippingDate']));
    });
  }

  @action
  void pressedSendMessage() {
    if (message.isNotEmpty) {
      chatRoom.collection('messages').add({
        'content': message,
        'idSender': authService.currentUser!.uid,
        'shippingDate': Timestamp.now(),
      });
      message = '';
      messageController.clear();
    }
  }
}
