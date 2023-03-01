import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:socialize/stores/user_store.dart';

class UserRepository {
  final authService = GetIt.instance<AuthService>();
  Future<Map<String, dynamic>?> getUser() async {
    if (authService.currentUser == null) return null;

    try {
      var user = await FirebaseFirestore.instance
          .collection('users')
          .doc(authService.currentUser!.uid)
          .get();
      return user.data();
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> getConversationResume() async {
    final userStore = GetIt.instance<UserStore>();
    var contacts = userStore.user?.contacts;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .where('id',
              whereIn: contacts?.map((e) => e.idContact).toList() ?? [])
          .where('title', isNotEqualTo: '')
          .get()
          .then((value) async {
        for (var item in value.docs) {
          var contact =
              contacts!.firstWhere((element) => element.idContact == item.id);
          contact.photoUrl = item.get('photoUrl');
          contact.name = item.get('name');
        }
      });

      await FirebaseFirestore.instance
          .collection('chat_rooms')
          .where(FieldPath.documentId,
              whereIn: contacts?.map((e) => e.idChatRoom).toList() ?? [])
          .where('title', isNotEqualTo: '')
          .get()
          .then((value) async {
        for (var item in value.docs) {
          var contact =
              contacts!.firstWhere((element) => element.idChatRoom == item.id);
          contact.lastMessage = item.get('lastMessage');
          contact.lastMessageTime =
              DateTime.parse(item.get('lastMessageTime').toDate().toString());
        }
      });
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> setUser(Map<String, dynamic> data) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authService.currentUser!.uid)
          .set(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> uploadAvatar(File photoFile) async {
    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef =
        storageRef.child("${authService.currentUser!.uid}.jpg");

    try {
      await mountainsRef.putFile(photoFile);
      return await mountainsRef.getDownloadURL();
    } on FirebaseException catch (e) {
      inspect(e);
    }
    return null;
  }
}
