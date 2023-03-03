import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:socialize/models/contact.dart';
import 'package:socialize/stores/user_store.dart';
import 'package:socialize/services/contact_service.dart';

part 'contact_store.g.dart';

// ignore: library_private_types_in_public_api
class ContactStore = _ContactStoreBase with _$ContactStore;

abstract class _ContactStoreBase with Store {
  final userStore = GetIt.instance<UserStore>();
  final _contactService = ContactService();

  @observable
  String? searchState = '';

  @observable
  List<ContactModel>? listNewContacts = [];

  @action
  void setSearchState(String? value) {
    searchState = value;
    searchNewContacts();
  }

  @computed
  String? get searchStateError {
    if (searchState == null || searchState!.isEmpty) {
      return 'Selecione um estado';
    }
    return null;
  }

  @action
  Future<void> searchNewContacts() async {
    await _contactService.getUsers(userStore.user!.id, searchState!).then(
        (value) => listNewContacts = value.docs
            .map((e) => ContactModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }
}
