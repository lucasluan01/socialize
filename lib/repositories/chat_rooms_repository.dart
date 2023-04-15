import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomsRepository {
  final CollectionReference _chatRoomsCollectionReference =
      FirebaseFirestore.instance.collection('chat_rooms');

  CollectionReference<Object?> getChatRooms() {
    return _chatRoomsCollectionReference;
  }

  CollectionReference<Object?> getMessages(String chatRoomID) {
    return _chatRoomsCollectionReference.doc(chatRoomID).collection('messages');
  }

  Future<DocumentReference<Object?>> createChatRoom(
      Map<String, dynamic> chatRoom) {
    return _chatRoomsCollectionReference.add(chatRoom);
  }

  Future<void> updateChatRooms(String chatRoomID, Map<String, dynamic> data) {
    return _chatRoomsCollectionReference.doc(chatRoomID).update(data);
  }
}
