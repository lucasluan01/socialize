// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStoreBase, Store {
  Computed<String>? _$nameInitialsComputed;

  @override
  String get nameInitials =>
      (_$nameInitialsComputed ??= Computed<String>(() => super.nameInitials,
              name: '_UserStoreBase.nameInitials'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_UserStoreBase.isFormValid'))
          .value;
  Computed<String?>? _$nameErrorComputed;

  @override
  String? get nameError =>
      (_$nameErrorComputed ??= Computed<String?>(() => super.nameError,
              name: '_UserStoreBase.nameError'))
          .value;
  Computed<String?>? _$stateErrorComputed;

  @override
  String? get stateError =>
      (_$stateErrorComputed ??= Computed<String?>(() => super.stateError,
              name: '_UserStoreBase.stateError'))
          .value;
  Computed<String?>? _$genderErrorComputed;

  @override
  String? get genderError =>
      (_$genderErrorComputed ??= Computed<String?>(() => super.genderError,
              name: '_UserStoreBase.genderError'))
          .value;
  Computed<CollectionReference<Map<String, dynamic>>>? _$userFirebaseComputed;

  @override
  CollectionReference<Map<String, dynamic>> get userFirebase =>
      (_$userFirebaseComputed ??=
              Computed<CollectionReference<Map<String, dynamic>>>(
                  () => super.userFirebase,
                  name: '_UserStoreBase.userFirebase'))
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

  late final _$contactsAtom =
      Atom(name: '_UserStoreBase.contacts', context: context);

  @override
  List<Map<String, dynamic>>? get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(List<Map<String, dynamic>>? value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
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

  late final _$loadingConversationAtom =
      Atom(name: '_UserStoreBase.loadingConversation', context: context);

  @override
  bool get loadingConversation {
    _$loadingConversationAtom.reportRead();
    return super.loadingConversation;
  }

  @override
  set loadingConversation(bool value) {
    _$loadingConversationAtom.reportWrite(value, super.loadingConversation, () {
      super.loadingConversation = value;
    });
  }

  late final _$nameAtom = Atom(name: '_UserStoreBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
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

  late final _$photoUrlAtom =
      Atom(name: '_UserStoreBase.photoUrl', context: context);

  @override
  String? get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String? value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  late final _$stateAtom = Atom(name: '_UserStoreBase.state', context: context);

  @override
  String? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$genderAtom =
      Atom(name: '_UserStoreBase.gender', context: context);

  @override
  String? get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String? value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$photoFileAtom =
      Atom(name: '_UserStoreBase.photoFile', context: context);

  @override
  File? get photoFile {
    _$photoFileAtom.reportRead();
    return super.photoFile;
  }

  @override
  set photoFile(File? value) {
    _$photoFileAtom.reportWrite(value, super.photoFile, () {
      super.photoFile = value;
    });
  }

  late final _$userDocumentAtom =
      Atom(name: '_UserStoreBase.userDocument', context: context);

  @override
  List<QueryDocumentSnapshot<Object?>>? get userDocument {
    _$userDocumentAtom.reportRead();
    return super.userDocument;
  }

  @override
  set userDocument(List<QueryDocumentSnapshot<Object?>>? value) {
    _$userDocumentAtom.reportWrite(value, super.userDocument, () {
      super.userDocument = value;
    });
  }

  late final _$getCurrentUserAsyncAction =
      AsyncAction('_UserStoreBase.getCurrentUser', context: context);

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  late final _$pressedSaveAsyncAction =
      AsyncAction('_UserStoreBase.pressedSave', context: context);

  @override
  Future<void> pressedSave() {
    return _$pressedSaveAsyncAction.run(() => super.pressedSave());
  }

  late final _$selectImageAsyncAction =
      AsyncAction('_UserStoreBase.selectImage', context: context);

  @override
  Future<void> selectImage(String resource) {
    return _$selectImageAsyncAction.run(() => super.selectImage(resource));
  }

  late final _$loadConversationResumeAsyncAction =
      AsyncAction('_UserStoreBase.loadConversationResume', context: context);

  @override
  Future<void> loadConversationResume() {
    return _$loadConversationResumeAsyncAction
        .run(() => super.loadConversationResume());
  }

  late final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase', context: context);

  @override
  void setName(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhotoUrl(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setPhotoUrl');
    try {
      return super.setPhotoUrl(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGender(String? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserModel? value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listenToUser() {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.listenToUser');
    try {
      return super.listenToUser();
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
contacts: ${contacts},
showErrors: ${showErrors},
loadingConversation: ${loadingConversation},
name: ${name},
email: ${email},
photoUrl: ${photoUrl},
state: ${state},
gender: ${gender},
photoFile: ${photoFile},
userDocument: ${userDocument},
nameInitials: ${nameInitials},
isFormValid: ${isFormValid},
nameError: ${nameError},
stateError: ${stateError},
genderError: ${genderError},
userFirebase: ${userFirebase}
    ''';
  }
}
