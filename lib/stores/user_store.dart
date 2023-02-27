import 'dart:developer';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/models/user.dart';
import 'package:socialize/repositories/user_repository.dart';

part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final authService = GetIt.instance<AuthService>();

  _UserStoreBase() {
    getCurrentUser();
  }

  @observable
  User? user;

  @observable
  bool showErrors = false;

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
      return 'Estado é obrigatório';
    }
    return null;
  }

  @computed
  String? get genderError {
    if (showErrors && (gender == null || gender!.isEmpty)) {
      return 'Gênero é obrigatório';
    }
    return null;
  }

  @action
  void setUser(User? value) => user = value;

  Future<void> getCurrentUser() async {
    if (authService.currentUser != null) {
      setEmail(authService.currentUser!.email);
    }

    final user = await UserRepository().getUser();

    if (user != null) {
      setUser(User.fromJson(user));
      setName(user['name']);
      setGender(user['gender']);
      setState(user['state']);
      setPhotoUrl(user['photoUrl']);
    }
  }

  Future<void> setUserData() async {
    final user = User(
      id: authService.currentUser!.uid,
      name: name!,
      state: state!,
      email: email!,
      gender: gender!,
      photoUrl: photoUrl,
    );

    try {
      await UserRepository().setUser(user.toJson());
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
        inspect(e);
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
    photoFile = null;
  }
}
