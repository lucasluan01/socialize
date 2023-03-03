import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/models/message_model.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({
    required this.message,
    super.key,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final authService = GetIt.instance<AuthService>();
    bool isCurrentUser = authService.currentUser!.uid == message.senderID;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              minWidth: 75,
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCurrentUser
                  ? Theme.of(context).primaryColor
                  : Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: [
                Text(
                  message.content,
                  style: TextStyle(
                    fontSize: 16,
                    color: isCurrentUser ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          DateFormat("HH:mm").format(
            DateTime.fromMicrosecondsSinceEpoch(
                message.sendedAt.microsecondsSinceEpoch),
          ),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
