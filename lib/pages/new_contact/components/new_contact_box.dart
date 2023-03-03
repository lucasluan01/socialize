import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/components/circle_avatar_custom.dart';
import 'package:socialize/models/contact.dart';

class NewContactBox extends StatefulWidget {
  const NewContactBox({required this.contact, super.key});

  final ContactModel contact;

  @override
  State<NewContactBox> createState() => _NewContactBoxState();
}

class _NewContactBoxState extends State<NewContactBox> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading:
          avatar(context: context, photo: widget.contact.photoUrl, radius: 20),
      title: Text(widget.contact.name),
      onTap: () {
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
                  // TODO: Criar nova conversa
                  // final newChat = await talksStore.createNewRoom();
                  // await talksStore.createNewContact(widget.id, newChat);

                  // final chatStore = GetIt.instance<ChatStore>();
                  // chatStore.setIdChat(newChat);

                  // // ignore: use_build_context_synchronously
                  // Navigator.pop(context);
                  // // ignore: use_build_context_synchronously
                  // Navigator.pushNamed(context, '/chat');
                },
                child: const Text('Sim'),
              ),
            ],
          ),
        );
      },
    );
  }
}
