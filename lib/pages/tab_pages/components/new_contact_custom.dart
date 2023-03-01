import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/stores/chat_store.dart';
import 'package:socialize/stores/talks_store.dart';

class NewContactCustom extends StatefulWidget {
  const NewContactCustom({
    required this.id,
    required this.name,
    required this.photoUrl,
    super.key,
  });

  final String name, id;
  final String? photoUrl;

  @override
  State<NewContactCustom> createState() => _NewContactCustomState();
}

class _NewContactCustomState extends State<NewContactCustom> {
  final talksStore = GetIt.instance<TalksStore>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: widget.photoUrl != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(widget.photoUrl!),
            )
          : const CircleAvatar(
              child: Icon(Icons.person),
            ),
      title: Text(widget.name),
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(widget.name),
            content: const Text(
                'Deseja iniciar uma nova conversa com esse usuário?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  final newChat = await talksStore.createNewRoom();
                  await talksStore.createNewContact(widget.id, newChat);

                  final chatStore = GetIt.instance<ChatStore>();
                  chatStore.setIdChat(newChat);

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, '/chat');
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
