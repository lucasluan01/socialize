// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStoreBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_UserStoreBase.isFormValid'))
          .value;
  Computed<String?>? _$nameFieldErrorComputed;

  @override
  String? get nameFieldError => (_$nameFieldErrorComputed ??= Computed<String?>(
          () => super.nameFieldError,
          name: '_UserStoreBase.nameFieldError'))
      .value;
  Computed<String?>? _$stateFieldErrorComputed;

  @override
  String? get stateFieldError => (_$stateFieldErrorComputed ??=
          Computed<String?>(() => super.stateFieldError,
              name: '_UserStoreBase.stateFieldError'))
      .value;
  Computed<String?>? _$genderFieldErrorComputed;

  @override
  String? get genderFieldError => (_$genderFieldErrorComputed ??=
          Computed<String?>(() => super.genderFieldError,
              name: '_UserStoreBase.genderFieldError'))
      .value;

  late final _$userAtom = Atom(name: '_UserStoreBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$nameFieldAtom =
      Atom(name: '_UserStoreBase.nameField', context: context);

  @override
  String? get nameField {
    _$nameFieldAtom.reportRead();
    return super.nameField;
  }

  @override
  set nameField(String? value) {
    _$nameFieldAtom.reportWrite(value, super.nameField, () {
      super.nameField = value;
    });
  }

  late final _$emailFieldAtom =
      Atom(name: '_UserStoreBase.emailField', context: context);

  @override
  String? get emailField {
    _$emailFieldAtom.reportRead();
    return super.emailField;
  }

  @override
  set emailField(String? value) {
    _$emailFieldAtom.reportWrite(value, super.emailField, () {
      super.emailField = value;
    });
  }

  late final _$stateFieldAtom =
      Atom(name: '_UserStoreBase.stateField', context: context);

  @override
  String? get stateField {
    _$stateFieldAtom.reportRead();
    return super.stateField;
  }

  @override
  set stateField(String? value) {
    _$stateFieldAtom.reportWrite(value, super.stateField, () {
      super.stateField = value;
    });
  }

  late final _$genderFieldAtom =
      Atom(name: '_UserStoreBase.genderField', context: context);

  @override
  String? get genderField {
    _$genderFieldAtom.reportRead();
    return super.genderField;
  }

  @override
  set genderField(String? value) {
    _$genderFieldAtom.reportWrite(value, super.genderField, () {
      super.genderField = value;
    });
  }

  late final _$emailAtom = Atom(name: '_UserStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_UserStoreBase.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$photoUrlFieldAtom =
      Atom(name: '_UserStoreBase.photoUrlField', context: context);

  @override
  dynamic get photoUrlField {
    _$photoUrlFieldAtom.reportRead();
    return super.photoUrlField;
  }

  @override
  set photoUrlField(dynamic value) {
    _$photoUrlFieldAtom.reportWrite(value, super.photoUrlField, () {
      super.photoUrlField = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('_UserStoreBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$selectImageAsyncAction =
      AsyncAction('_UserStoreBase.selectImage', context: context);

  @override
  Future<void> selectImage(String resource) {
    return _$selectImageAsyncAction.run(() => super.selectImage(resource));
  }

  late final _$pressedSaveAsyncAction =
      AsyncAction('_UserStoreBase.pressedSave', context: context);

  @override
  Future<void> pressedSave() {
    return _$pressedSaveAsyncAction.run(() => super.pressedSave());
  }

  late final _$setUserDataAsyncAction =
      AsyncAction('_UserStoreBase.setUserData', context: context);

  @override
  Future<void> setUserData() {
    return _$setUserDataAsyncAction.run(() => super.setUserData());
  }

  late final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase', context: context);

  @override
  void setFieldName(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setFieldName');
    try {
      return super.setFieldName(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFieldEmail(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setFieldEmail');
    try {
      return super.setFieldEmail(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFieldPhotoUrl(dynamic value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setFieldPhotoUrl');
    try {
      return super.setFieldPhotoUrl(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFieldState(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setFieldState');
    try {
      return super.setFieldState(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFieldGender(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setFieldGender');
    try {
      return super.setFieldGender(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
nameField: ${nameField},
emailField: ${emailField},
stateField: ${stateField},
genderField: ${genderField},
email: ${email},
showErrors: ${showErrors},
photoUrlField: ${photoUrlField},
isFormValid: ${isFormValid},
nameFieldError: ${nameFieldError},
stateFieldError: ${stateFieldError},
genderFieldError: ${genderFieldError}
    ''';
  }
}
