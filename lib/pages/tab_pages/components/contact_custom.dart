import 'package:flutter/material.dart';

class ContactCustom extends StatefulWidget {
  const ContactCustom({
    required this.name,
    required this.photoUrl,
    super.key,
  });

  final String name;
  final String? photoUrl;

  @override
  State<ContactCustom> createState() => _ContactCustomState();
}

class _ContactCustomState extends State<ContactCustom> {
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
      title: Row(children: [
        Text(widget.name),
        // TODO: Implementar status
        // SizedBox(width: 8),
        // CircleAvatar(
        //   radius: 4,
        //   backgroundColor: Colors.green,
        // ),
        const Spacer(),
        const Text(
          "12:00",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ]),
      isThreeLine: false,
      subtitle: const Text(
        "Olá, tudo bem?",
        style: TextStyle(),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
    );
  }
}
