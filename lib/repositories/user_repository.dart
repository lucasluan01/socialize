import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserRepository {
  final authService = GetIt.instance<AuthService>();

  Future<Map<String, dynamic>?> getUser() async {
    if (authService.currentUser == null) return null;

    var user = await FirebaseFirestore.instance
        .collection('users')
        .doc(authService.currentUser!.uid)
        .get();
    return user.data();
  }

  Future<List<Map<String, dynamic>>?> getContacts() async {
    List<Map<String, dynamic>> contacts = [];
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authService.currentUser!.uid)
          .collection('contacts')
          .get()
          .then((value) async {
        for (var item in value.docs) {
          if (item.id != 'default') {
            contacts.add(item.data());
          }
        }
      });

      return contacts;
    } catch (e) {
      inspect(e);
      rethrow;
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
