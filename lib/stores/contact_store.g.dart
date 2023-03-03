// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactStore on _ContactStoreBase, Store {
  Computed<String?>? _$searchStateErrorComputed;

  @override
  String? get searchStateError => (_$searchStateErrorComputed ??=
          Computed<String?>(() => super.searchStateError,
              name: '_ContactStoreBase.searchStateError'))
      .value;

  late final _$searchStateAtom =
      Atom(name: '_ContactStoreBase.searchState', context: context);

  @override
  String? get searchState {
    _$searchStateAtom.reportRead();
    return super.searchState;
  }

  @override
  set searchState(String? value) {
    _$searchStateAtom.reportWrite(value, super.searchState, () {
      super.searchState = value;
    });
  }

  late final _$listNewContactsAtom =
      Atom(name: '_ContactStoreBase.listNewContacts', context: context);

  @override
  List<ContactModel>? get listNewContacts {
    _$listNewContactsAtom.reportRead();
    return super.listNewContacts;
  }

  @override
  set listNewContacts(List<ContactModel>? value) {
    _$listNewContactsAtom.reportWrite(value, super.listNewContacts, () {
      super.listNewContacts = value;
    });
  }

  late final _$searchNewContactsAsyncAction =
      AsyncAction('_ContactStoreBase.searchNewContacts', context: context);

  @override
  Future<void> searchNewContacts() {
    return _$searchNewContactsAsyncAction.run(() => super.searchNewContacts());
  }

  late final _$_ContactStoreBaseActionController =
      ActionController(name: '_ContactStoreBase', context: context);

  @override
  void setSearchState(String? value) {
    final _$actionInfo = _$_ContactStoreBaseActionController.startAction(
        name: '_ContactStoreBase.setSearchState');
    try {
      return super.setSearchState(value);
    } finally {
      _$_ContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchState: ${searchState},
listNewContacts: ${listNewContacts},
searchStateError: ${searchStateError}
    ''';
  }
}
