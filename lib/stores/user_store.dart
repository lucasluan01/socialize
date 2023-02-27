import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/models/user.dart';
import 'package:socialize/repositories/user_repository.dart';
part 'user_store.g.dart';

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

  @computed
  bool get isFormValid =>
      nameError == null &&
      // photoUrlError == null &&
      stateError == null &&
      genderError == null;

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
  String? get photoUrlError {
    if (showErrors && (photoUrl == null || photoUrl!.isEmpty)) {
      return 'Foto é obrigatória';
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
    authService.currentUser != null
        ? setEmail(authService.currentUser!.email)
        : null;

    final user = await UserRepository().getUser();

    if (user != null) {
      setUser(User.fromJson(user));
      setName(user['name']);
      setGender(user['gender']);
      setState(user['state']);
    }
  }

  // Future<void> createUser() async {
  //   await UserRepository().createUser();
  //   getCurrentUser();
  // }

  Future<void> updateUser() async {
    final user = User(
      id: authService.currentUser!.uid,
      name: name!,
      state: state!,
      email: email!,
      gender: gender!,
    );

    try {
      await UserRepository().updateUser(user.toJson());
    } catch (e) {
      inspect(e);
    }
  }

  @action
  void pressedSave() {
    showErrors = true;
    if (isFormValid) {
      updateUser();
    }
  }
}
