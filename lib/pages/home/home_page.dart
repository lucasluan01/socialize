import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/components/new_contact_box.dart';
import 'package:socialize/stores/chat_rooms_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _chatRoomsStore = GetIt.I<ChatRoomsStore>();

  @override
  void initState() {
    super.initState();
    _chatRoomsStore.getchatRoomsStream();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (_, index) => const SizedBox(height: 4),
          padding: const EdgeInsets.all(16.0),
          itemCount: _chatRoomsStore.currentUserConversations.length,
          itemBuilder: (_, index) {
            return ContactBox(
              contact: _chatRoomsStore.currentUserConversations[index],
            );
          },
        );
      },
    );
  }
}
