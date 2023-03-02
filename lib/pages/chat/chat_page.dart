import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/pages/chat/components/message_box_custom.dart';
import 'package:socialize/pages/chat/components/message_field_custom.dart';
import 'package:socialize/stores/chat_store.dart';
import 'package:socialize/models/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatStore = GetIt.instance<ChatStore>();

  @override
  void initState() {
    super.initState();
    chatStore.listenToChatMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) => ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  reverse: true,
                  separatorBuilder: (_, index) => const SizedBox(height: 16),
                  itemCount: chatStore.messages.length,
                  itemBuilder: (_, index) {
                    final message = MessageModel.fromJson(
                        chatStore.messages[index].data()
                            as Map<String, dynamic>);

                    return MessageBoxCustom(message: message);
                  },
                ),
              ),
            ),
            const MessageFieldCustom(),
          ],
        ),
      ),
    );
  }
}
