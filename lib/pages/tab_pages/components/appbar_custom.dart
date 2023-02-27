import 'package:flutter/material.dart';
import 'package:socialize/auth/auth_service.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return AppBar(
      title: const Text("Socialize"),
      bottom: TabBar(
        indicatorWeight: 4,
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black54,
        tabs: const [
          Tab(text: 'Conversas'),
          Tab(text: 'Procurar'),
        ],
      ),
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
          onSelected: (value) async {
            if (value == 1) {
              Navigator.pushNamed(context, '/profile');
            } else if (value == 2) {
              await authService.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, '/');
            }
          },
        ),
      ],
    );
  }
}
