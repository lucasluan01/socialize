// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStoreBase, Store {
  Computed<DocumentReference<Map<String, dynamic>>>? _$chatRoomComputed;

  @override
  DocumentReference<Map<String, dynamic>> get chatRoom =>
      (_$chatRoomComputed ??= Computed<DocumentReference<Map<String, dynamic>>>(
              () => super.chatRoom,
              name: '_ChatStoreBase.chatRoom'))
          .value;

  late final _$messagesAtom =
      Atom(name: '_ChatStoreBase.messages', context: context);

  @override
  List<QueryDocumentSnapshot<Object?>> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(List<QueryDocumentSnapshot<Object?>> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$messageControllerAtom =
      Atom(name: '_ChatStoreBase.messageController', context: context);

  @override
  TextEditingController get messageController {
    _$messageControllerAtom.reportRead();
    return super.messageController;
  }

  @override
  set messageController(TextEditingController value) {
    _$messageControllerAtom.reportWrite(value, super.messageController, () {
      super.messageController = value;
    });
  }

  late final _$idChatAtom =
      Atom(name: '_ChatStoreBase.idChat', context: context);

  @override
  String? get idChat {
    _$idChatAtom.reportRead();
    return super.idChat;
  }

  @override
  set idChat(String? value) {
    _$idChatAtom.reportWrite(value, super.idChat, () {
      super.idChat = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_ChatStoreBase.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase', context: context);

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdChat(String? value) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.setIdChat');
    try {
      return super.setIdChat(value);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void listenToChatMessages() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.listenToChatMessages');
    try {
      return super.listenToChatMessages();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pressedSendMessage() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.pressedSendMessage');
    try {
      return super.pressedSendMessage();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
messageController: ${messageController},
idChat: ${idChat},
message: ${message},
chatRoom: ${chatRoom}
    ''';
  }
}
