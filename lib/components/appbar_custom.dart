import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Socialize"),
      actions: [
        PopupMenuButton<int>(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text("Perfil"),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text("Sair"),
            ),
          ],
          offset: const Offset(0, 0),
          elevation: 2,
          onSelected: (value) {
            if (value == 1) {
              Navigator.pushNamed(context, '/profile');
            } else if (value == 2) {
              // _showDialog(context);
            }
          },
        ),
      ],
    );
  }
}
