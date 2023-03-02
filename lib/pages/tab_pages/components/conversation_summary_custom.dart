import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:socialize/models/contact.dart';
import 'package:socialize/stores/chat_store.dart';

class ConversationSummaryCustom extends StatefulWidget {
  const ConversationSummaryCustom({
    required this.contact,
    super.key,
  });

  final ContactModel contact;

  @override
  State<ConversationSummaryCustom> createState() =>
      _ConversationSummaryCustomState();
}

class _ConversationSummaryCustomState extends State<ConversationSummaryCustom> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: widget.contact.photoUrl != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(widget.contact.photoUrl!),
            )
          : const CircleAvatar(
              child: Icon(Icons.person),
            ),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(widget.contact.name!),
        // TODO: Implementar status
        // SizedBox(width: 8),
        // CircleAvatar(
        //   radius: 4,
        //   backgroundColor: Colors.green,
        // ),
        Text(
          widget.contact.lastMessageTime != null
              ? DateFormat("HH:mm").format(
                  DateTime.fromMicrosecondsSinceEpoch(
                      widget.contact.lastMessageTime!.microsecondsSinceEpoch),
                )
              : '',
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ]),
      isThreeLine: false,
      subtitle: Text(
        widget.contact.lastMessage ?? "",
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () async {
        final chatStore = GetIt.instance<ChatStore>();
        chatStore.setIdChat(widget.contact.idChatRoom);

        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/chat');
      },
    );
  }
}
