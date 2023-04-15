import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/components/dropdown_custom.dart';
import 'package:socialize/components/contact_box.dart';
import 'package:socialize/stores/contact_store.dart';

class NewContactsPage extends StatefulWidget {
  const NewContactsPage({super.key});

  @override
  State<NewContactsPage> createState() => _NewContactsPageState();
}

class _NewContactsPageState extends State<NewContactsPage> {
  final contactStore = GetIt.instance<ContactStore>();

  @override
  void initState() {
    super.initState();
    contactStore.setSearchState(contactStore.userStore.user!.state);
    contactStore.searchNewContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Observer(builder: (_) {
            return DropdownCustom(
              dropdownType: "Estado",
              labelText: "Estado",
              initialValue: contactStore.userStore.user!.state,
              messageError: contactStore.searchStateError,
              onChanged: contactStore.setSearchState,
            );
          }),
          const SizedBox(height: 16),
          Observer(builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: contactStore.listNewContacts!
                  .map((e) => ContactBox(contact: e))
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
