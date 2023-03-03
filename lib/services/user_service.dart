import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialize/exceptions.dart';
import 'package:socialize/models/user.dart';
import 'package:socialize/repositories/user_repository.dart';

class UserService {
  final _userRepository = UserRepository();

  Future<DocumentSnapshot<Object?>> getUser(String currentUserId) {
    return _userRepository.getUser(currentUserId);
  }

  Future<void> setUser(String currentUserId, UserModel user) async {
    await _userRepository.setUser(currentUserId, user.toJson());
  }

  // TODO: Implementar no futuro
  // Future<void> deleteUser() async {
  // DocumentSnapshot snapshot = await _repository.getDocument(id);
  // await _repository.deleteUser(snapshot);
  // }

  // TODO: Esse método tem que estar no service???
  Future<String?> uploadAvatar(String currentUserId, File photo) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child("$currentUserId.jpg");

    try {
      await imageRef.putFile(photo);
      return await imageRef.getDownloadURL();
    } catch (e) {
      final errorMessage = getFirebaseExceptionMessage(e);
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return null;
  }
}
