import 'package:flutter/material.dart';

class NewContactCustom extends StatefulWidget {
  const NewContactCustom({
    required this.name,
    required this.photoUrl,
    super.key,
  });

  final String name;
  final String? photoUrl;

  @override
  State<NewContactCustom> createState() => _NewContactCustomState();
}

class _NewContactCustomState extends State<NewContactCustom> {
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
      onTap: () {},
    );
  }
}
