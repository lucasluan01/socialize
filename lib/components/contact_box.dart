import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:socialize/components/circle_avatar_custom.dart';
import 'package:socialize/models/contact.dart';
import 'package:socialize/stores/chat_rooms_store.dart';

class ContactBox extends StatefulWidget {
  const ContactBox({required this.contact, super.key});

  final ContactModel contact;

  @override
  State<ContactBox> createState() => _ContactBoxState();
}

class _ContactBoxState extends State<ContactBox> {
  final _chatRoomsStore = GetIt.instance<ChatRoomsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: avatar(
            context: context, photo: widget.contact.photoUrl, radius: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.contact.name),
            widget.contact.lastMessage?['sendedAt'] != null
                ? Text(
                    DateFormat("HH:mm").format(
                      DateTime.fromMicrosecondsSinceEpoch(widget.contact
                          .lastMessage!['sendedAt']!.microsecondsSinceEpoch),
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )
                : Container(),
          ],
        ),
        subtitle: Text(
          widget.contact.lastMessage?['content'] ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () async {
          _chatRoomsStore.setSelectedContact(widget.contact);
          await _chatRoomsStore.loadChatRoom(widget.contact.id).then((value) {
            if (_chatRoomsStore.currentChatRoomId.isNotEmpty) {
              Navigator.pushNamed(context, '/chat-room');
              return;
            }

            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(widget.contact.name),
                content: const Text(
                    'Deseja iniciar uma nova conversa com esse usuário?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancelar'),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await _chatRoomsStore
                          .createChatRoom(widget.contact.id)
                          .then((value) {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/chat-room');
                      });
                    },
                    child: const Text('Sim'),
                  ),
                ],
              ),
            );
          });
        },
      );
    });
  }
}
