// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStoreBase, Store {
  Computed<CollectionReference<Map<String, dynamic>>>? _$chatRoomComputed;

  @override
  CollectionReference<Map<String, dynamic>> get chatRoom =>
      (_$chatRoomComputed ??=
              Computed<CollectionReference<Map<String, dynamic>>>(
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

  late final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase', context: context);

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
  void listenToMyDocuments() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.listenToMyDocuments');
    try {
      return super.listenToMyDocuments();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
idChat: ${idChat},
chatRoom: ${chatRoom}
    ''';
  }
}
