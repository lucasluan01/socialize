import 'package:mobx/mobx.dart';
import 'package:socialize/models/user.dart';
import 'package:socialize/repositories/talks_repository.dart';

part 'talks_store.g.dart';

// ignore: library_private_types_in_public_api
class TalksStore = _TalksStoreBase with _$TalksStore;

abstract class _TalksStoreBase with Store {
  final talksRepository = TalksRepository();

  @observable
  String? searchState = "Minas Gerais";

  @observable
  List<UserModel>? newsTalks = [];

  @action
  void setSearchState(String? value) {
    searchState = value;
    getNewTalks();
  }

  @computed
  String? get searchStateError {
    if (searchState == null || searchState!.isEmpty) {
      return 'Selecione um estado';
    }
    return null;
  }

  @action
  Future<void> getNewTalks() async {
    final resultSearchTalks = await talksRepository.getNewTalks(searchState!);
    newsTalks =
        resultSearchTalks?.map((e) => UserModel.fromJson(e.data())).toList();
  }
}
