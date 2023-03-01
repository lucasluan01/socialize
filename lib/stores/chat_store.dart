import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

// ignore: library_private_types_in_public_api
class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  @observable
  List<QueryDocumentSnapshot> messages = [];

  @observable
  String? idChat;

  @computed
  CollectionReference<Map<String, dynamic>> get chatRoom =>
      FirebaseFirestore.instance
          .collection('chat_rooms')
          .doc(idChat)
          .collection('messages');

  @action
  void setIdChat(String? value) => idChat = value;

  @action
  void listenToMyDocuments() {
    chatRoom.where('title', isNotEqualTo: '').snapshots().listen((snapshot) {
      messages = snapshot.docs;
    });
  }
}
