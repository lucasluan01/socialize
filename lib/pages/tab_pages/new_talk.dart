import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/components/dropdown_custom.dart';
import 'package:socialize/pages/tab_pages/components/new_contact_custom.dart';
import 'package:socialize/stores/talks_store.dart';

class NewTalkPage extends StatefulWidget {
  const NewTalkPage({super.key});

  @override
  State<NewTalkPage> createState() => _NewTalkPageState();
}

class _NewTalkPageState extends State<NewTalkPage> {
  final talksStore = GetIt.instance<TalksStore>();

  @override
  void initState() {
    super.initState();

    talksStore.getNewTalks();
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
              initialValue: talksStore.searchState,
              messageError: talksStore.searchStateError,
              onChanged: talksStore.setSearchState,
            );
          }),
          const SizedBox(height: 16),
          Observer(builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: talksStore.newsTalks!
                  .map((e) => NewContactCustom(
                        name: e.name,
                        photoUrl: e.photoUrl,
                        id: e.id,
                      ))
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
