import 'dart:developer';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/models/user.dart';
import 'package:socialize/services/user_service.dart';

part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final _userService = UserService();
  final _authService = GetIt.instance<AuthService>();

  @observable
  UserModel? user;

  @observable
  String? nameField, emailField, stateField, genderField, email;

  @observable
  bool showErrors = false;

  @observable
  dynamic photoUrlField;

  @action
  void setFieldName(String? value) => nameField = value?.trim();

  @action
  void setFieldEmail(String? value) => emailField = value;

  @action
  void setFieldPhotoUrl(dynamic value) => photoUrlField = value;

  @action
  void setFieldState(String? value) => stateField = value;

  @action
  void setFieldGender(String? value) => genderField = value;

  @computed
  bool get isFormValid =>
      nameFieldError == null &&
      stateFieldError == null &&
      genderFieldError == null;

  @computed
  String? get nameFieldError {
    if (showErrors) {
      if (nameField == null || nameField!.isEmpty) {
        return 'Nome é obrigatório';
      }
      if (nameField!.length < 2) {
        return 'Nome deve ter pelo menos 2 caracteres';
      }
    }
    return null;
  }

  @computed
  String? get stateFieldError {
    if (showErrors && (stateField == null || stateField!.isEmpty)) {
      return 'Selecione um estado';
    }
    return null;
  }

  @computed
  String? get genderFieldError {
    if (showErrors && (genderField == null || genderField!.isEmpty)) {
      return 'Selecione um gênero';
    }
    return null;
  }

  @action
  Future<void> getUser() async {
    await _userService.getUser(_authService.currentUser!.uid).then((snapshot) {
      if (snapshot.data() != null) {
        user = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        user!.id = _authService.currentUser!.uid;
        setFields();
      } else {
        user = null;
      }
    });
    email = _authService.currentUser?.email;
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
        photoUrlField = null;
      }

      if (xFile != null) {
        photoUrlField = File(xFile.path);
      }
    } catch (e) {
      // TODO: verifir erros e remover o log
      inspect(e);
    }
  }

  @action
  Future<void> pressedSave() async {
    showErrors = true;

    if (isFormValid) {
      photoUrlField is File
          ? photoUrlField = await _userService.uploadAvatar(
              _authService.currentUser!.uid, photoUrlField)
          : null;
      setUser();
    }
  }

  @action
  Future<void> setUserData() async {
    user = UserModel(
      id: _authService.currentUser!.uid,
      name: nameField!,
      state: stateField!,
      gender: genderField!,
      photoUrl: photoUrlField,
    );
  }

  void setFields() {
    nameField = user?.name;
    photoUrlField = user?.photoUrl;
    stateField = user?.state;
    genderField = user?.gender;
  }

  // TODO: Implementar no futuro
  // Stream<List<UserModel>> getUsersStream() {
  //   return _userService.getUsersStream().map((querySnapshot) => querySnapshot
  //       .docs
  //       .map((doc) => UserModel.fromJson(doc as Map<String, dynamic>))
  //       .toList());
  // }

  Future<void> setUser() async {
    await _userService
        .setUser(
            _authService.currentUser!.uid,
            UserModel.fromJson({
              'name': nameField,
              'photoUrl': photoUrlField,
              'gender': genderField,
              'state': stateField,
            }))
        .then((value) => setUserData());
  }

  // TODO: Implement deleteUser no futuro
  // Future<void> deleteUser(UserModel user) async {
  //   await _userService.deleteUser();
  // }
}
