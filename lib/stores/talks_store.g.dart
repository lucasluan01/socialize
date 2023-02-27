// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TalksStore on _TalksStoreBase, Store {
  Computed<String?>? _$searchStateErrorComputed;

  @override
  String? get searchStateError => (_$searchStateErrorComputed ??=
          Computed<String?>(() => super.searchStateError,
              name: '_TalksStoreBase.searchStateError'))
      .value;

  late final _$searchStateAtom =
      Atom(name: '_TalksStoreBase.searchState', context: context);

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

  late final _$newsTalksAtom =
      Atom(name: '_TalksStoreBase.newsTalks', context: context);

  @override
  List<UserModel>? get newsTalks {
    _$newsTalksAtom.reportRead();
    return super.newsTalks;
  }

  @override
  set newsTalks(List<UserModel>? value) {
    _$newsTalksAtom.reportWrite(value, super.newsTalks, () {
      super.newsTalks = value;
    });
  }

  late final _$getNewTalksAsyncAction =
      AsyncAction('_TalksStoreBase.getNewTalks', context: context);

  @override
  Future<void> getNewTalks() {
    return _$getNewTalksAsyncAction.run(() => super.getNewTalks());
  }

  late final _$_TalksStoreBaseActionController =
      ActionController(name: '_TalksStoreBase', context: context);

  @override
  void setSearchState(String? value) {
    final _$actionInfo = _$_TalksStoreBaseActionController.startAction(
        name: '_TalksStoreBase.setSearchState');
    try {
      return super.setSearchState(value);
    } finally {
      _$_TalksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchState: ${searchState},
newsTalks: ${newsTalks},
searchStateError: ${searchStateError}
    ''';
  }
}
