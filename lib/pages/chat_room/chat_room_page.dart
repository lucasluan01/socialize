import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/components/circle_avatar_custom.dart';
import 'package:socialize/pages/chat_room/components/message_box.dart';
import 'package:socialize/pages/chat_room/components/message_field.dart';
import 'package:socialize/stores/chat_rooms_store.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final _chatRoomsStore = GetIt.instance<ChatRoomsStore>();

  @override
  void initState() {
    super.initState();
    _chatRoomsStore.getMessagesStream();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              avatar(
                context: context,
                photo: _chatRoomsStore.selectedContact!.photoUrl,
                radius: 20,
              ),
              const SizedBox(width: 16),
              Text(
                _chatRoomsStore.selectedContact!.name,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  reverse: true,
                  separatorBuilder: (_, index) => const SizedBox(height: 8),
                  itemCount: _chatRoomsStore.messages.length,
                  itemBuilder: (_, index) {
                    return MessageBox(message: _chatRoomsStore.messages[index]);
                  },
                ),
              ),
              const MessageField(),
            ],
          ),
        ),
      );
    });
  }
}
