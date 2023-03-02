import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/exceptions.dart';
import 'package:socialize/models/contact.dart';
import 'package:socialize/models/user.dart';
import 'package:socialize/repositories/user_repository.dart';

part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final authService = GetIt.instance<AuthService>();
  final userRepository = UserRepository();

  @observable
  UserModel? user;

  @observable
  List<Map<String, dynamic>>? contacts;

  @observable
  bool showErrors = false, loadingConversation = true;

  @observable
  String? name, email, photoUrl, state, gender;

  @observable
  File? photoFile;

  @action
  void setName(String? value) => name = value;

  @action
  void setEmail(String? value) => email = value;

  @action
  void setPhotoUrl(String? value) => photoUrl = value;

  @action
  void setState(String? value) => state = value;

  @action
  void setGender(String? value) => gender = value;

  @action
  void setUser(UserModel? value) {
    user = value;
    name = value?.name;
    email = value?.email;
    photoUrl = value?.photoUrl;
    state = value?.state;
    gender = value?.gender;
  }

  String? getphotoUrl() => photoUrl;

  File? getPhotoFile() => photoFile;

  @computed
  String get nameInitials {
    if (name != null && name!.isNotEmpty) {
      final nameSplit = name!.trim().split(' ');
      if (nameSplit.length == 1) {
        return nameSplit[0].substring(0, 1).toUpperCase();
      }
      return nameSplit[0].substring(0, 1).toUpperCase() +
          nameSplit[1].substring(0, 1).toUpperCase();
    }
    return "?";
  }

  @computed
  bool get isFormValid =>
      nameError == null && stateError == null && genderError == null;

  @computed
  String? get nameError {
    if (showErrors) {
      if (name == null || name!.isEmpty) {
        return 'Nome é obrigatório';
      }
      if (name!.length < 2) {
        return 'Nome deve ter pelo menos 2 caracteres';
      }
    }
    return null;
  }

  @computed
  String? get stateError {
    if (showErrors && (state == null || state!.isEmpty)) {
      return 'Selecione um estado';
    }
    return null;
  }

  @computed
  String? get genderError {
    if (showErrors && (gender == null || gender!.isEmpty)) {
      return 'Selecione um gênero';
    }
    return null;
  }

  @action
  Future<void> loadCurrentUserData() async {
    final user = await userRepository.getUserDocument();

    setEmail(authService.currentUser!.email);

    if (user != null) {
      user['contacts'] = contacts;
      setUser(UserModel.fromJson(user));
    }
  }

  Future<void> setUserData() async {
    setUser(UserModel(
      id: authService.currentUser!.uid,
      name: name!,
      state: state!,
      email: email!,
      gender: gender!,
      photoUrl: photoUrl,
      contacts: user?.contacts ?? <ContactModel>[],
    ));

    try {
      await UserRepository().setUser(user!.toJson());
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> updatePhoto() async {
    if (photoFile != null) {
      try {
        final url = await UserRepository().uploadAvatar(photoFile!);
        setPhotoUrl(url);
      } catch (e) {
        final errorMessage = getFirebaseExceptionMessage(e);
        Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: errorMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }

  @action
  Future<void> pressedSave() async {
    showErrors = true;
    if (isFormValid) {
      await updatePhoto();
      await setUserData();
    }
  }

  @action
  Future<void> selectImage(String resource) async {
    final ImagePicker picker = ImagePicker();
    XFile? xFile;
    try {
      if (resource == "gallery") {
        xFile = await picker.pickImage(source: ImageSource.gallery);
      } else if (resource == "camera") {
        xFile = await picker.pickImage(source: ImageSource.camera);
      } else {
        photoUrl = null;
        photoFile = null;
      }

      if (xFile != null) {
        photoFile = File(xFile.path);
      }
    } catch (e) {
      inspect(e);
    }
  }

  @action
  void dispose() {
    // TODO: Verificar se faz sentido manter photoFile no futuro
    photoFile = null;
    showErrors = false;
  }

  @observable
  List<QueryDocumentSnapshot>? userDocument;

  @computed
  CollectionReference<Map<String, dynamic>> get userContactCollection =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(authService.currentUser!.uid)
          .collection("contacts");

  @action
  void listenToUserConversations() {
    userContactCollection
        .where(FieldPath.documentId, isNotEqualTo: 'empty')
        .snapshots()
        .listen((snapshot) async {
      loadingConversation = true;
      contacts = snapshot.docs.map((e) => e.data()).toList();
      await userRepository.getConversationResume();
      user!.contacts = contacts!.map((e) => ContactModel.fromJson(e)).toList();
      loadingConversation = false;
    });
  }
}
