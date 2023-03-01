import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/stores/chat_store.dart';
import 'package:socialize/models/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatStore = GetIt.instance<ChatStore>();
  final authService = GetIt.instance<AuthService>();

  @override
  void initState() {
    super.initState();
    chatStore.listenToMyDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => ListView.separated(
            separatorBuilder: (_, index) => const SizedBox(height: 16),
            padding: const EdgeInsets.all(16.0),
            itemCount: chatStore.messages.length,
            itemBuilder: (_, index) {
              final message = MessageModel.fromJson(
                  chatStore.messages[index].data() as Map<String, dynamic>);

              bool isCurrentUser =
                  authService.currentUser!.uid == message.idSender;

              return Align(
                alignment: isCurrentUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: isCurrentUser
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomLeft: isCurrentUser
                          ? const Radius.circular(20)
                          : const Radius.circular(0),
                      bottomRight: isCurrentUser
                          ? const Radius.circular(0)
                          : const Radius.circular(20),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    title: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isCurrentUser ? "Eu" : "Zé Colméia",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color:
                                  isCurrentUser ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            DateFormat("HH:mm").format(DateTime.parse(
                                message.shippingDate.toString())),
                            style: TextStyle(
                              fontSize: 12,
                              color:
                                  isCurrentUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      message.content,
                      style: TextStyle(
                        fontSize: 16,
                        color: isCurrentUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
