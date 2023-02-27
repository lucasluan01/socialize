import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/components/dropdown_custom.dart';
import 'package:socialize/pages/profile/components/circle_avatar_custom.dart';
import 'package:socialize/stores/user_store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userStore = GetIt.instance<UserStore>();

  @override
  void dispose() {
    super.dispose();
    userStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 32,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CircleAvatarCustom(),
                    const SizedBox(height: 32),
                    Observer(builder: (_) {
                      return TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          border: const OutlineInputBorder(),
                          errorText: userStore.nameError,
                          suffixIcon: userStore.nameError != null
                              ? const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                )
                              : null,
                        ),
                        onChanged: (value) => userStore.setName(value),
                        initialValue: userStore.name,
                      );
                    }),
                    const SizedBox(height: 16),
                    const DropdownCustom(dropdownType: "Estado"),
                    const SizedBox(height: 16),
                    const DropdownCustom(dropdownType: "Gênero"),
                    const SizedBox(height: 16),
                    Observer(builder: (context) {
                      return TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(),
                          filled: true,
                        ),
                        initialValue: userStore.email,
                        enabled: false,
                      );
                    }),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () => userStore.pressedSave(),
                      child: const Text('Salvar'),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
