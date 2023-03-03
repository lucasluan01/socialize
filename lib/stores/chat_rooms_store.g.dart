// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_rooms_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatRoomsStore on _ChatRoomsStoreBase, Store {
  late final _$messagesAtom =
      Atom(name: '_ChatRoomsStoreBase.messages', context: context);

  @override
  List<MessageModel> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(List<MessageModel> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$currentChatRoomIdAtom =
      Atom(name: '_ChatRoomsStoreBase.currentChatRoomId', context: context);

  @override
  String get currentChatRoomId {
    _$currentChatRoomIdAtom.reportRead();
    return super.currentChatRoomId;
  }

  @override
  set currentChatRoomId(String value) {
    _$currentChatRoomIdAtom.reportWrite(value, super.currentChatRoomId, () {
      super.currentChatRoomId = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_ChatRoomsStoreBase.message', context: context);

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

  late final _$messageControllerAtom =
      Atom(name: '_ChatRoomsStoreBase.messageController', context: context);

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

  late final _$loadChatRoomAsyncAction =
      AsyncAction('_ChatRoomsStoreBase.loadChatRoom', context: context);

  @override
  Future<void> loadChatRoom(String contactID) {
    return _$loadChatRoomAsyncAction.run(() => super.loadChatRoom(contactID));
  }

  late final _$createChatRoomAsyncAction =
      AsyncAction('_ChatRoomsStoreBase.createChatRoom', context: context);

  @override
  Future<void> createChatRoom(String contactID) {
    return _$createChatRoomAsyncAction
        .run(() => super.createChatRoom(contactID));
  }

  late final _$_ChatRoomsStoreBaseActionController =
      ActionController(name: '_ChatRoomsStoreBase', context: context);

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_ChatRoomsStoreBaseActionController.startAction(
        name: '_ChatRoomsStoreBase.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_ChatRoomsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pressedSendMessage() {
    final _$actionInfo = _$_ChatRoomsStoreBaseActionController.startAction(
        name: '_ChatRoomsStoreBase.pressedSendMessage');
    try {
      return super.pressedSendMessage();
    } finally {
      _$_ChatRoomsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getMessagesStream() {
    final _$actionInfo = _$_ChatRoomsStoreBaseActionController.startAction(
        name: '_ChatRoomsStoreBase.getMessagesStream');
    try {
      return super.getMessagesStream();
    } finally {
      _$_ChatRoomsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
currentChatRoomId: ${currentChatRoomId},
message: ${message},
messageController: ${messageController}
    ''';
  }
}
