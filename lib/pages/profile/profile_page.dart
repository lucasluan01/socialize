import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/components/dropdown_custom.dart';
import 'package:socialize/pages/profile/components/avatar_custom.dart';
import 'package:socialize/stores/user_store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userStore = GetIt.instance<UserStore>();

  @override
  Widget build(BuildContext context) {
    userStore.setFields();

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
                    // TODO: Implementar a imagem do usuário se ele tiver
                    const CircleAvatarCustom(),
                    const SizedBox(height: 32),
                    Observer(builder: (_) {
                      return TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          border: const OutlineInputBorder(),
                          errorText: userStore.nameFieldError,
                          suffixIcon: userStore.nameFieldError != null
                              ? const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                )
                              : null,
                        ),
                        onChanged: (value) => userStore.setFieldName(value),
                        initialValue: userStore.nameField,
                      );
                    }),
                    const SizedBox(height: 16),
                    Observer(builder: (_) {
                      return DropdownCustom(
                        dropdownType: "Estado",
                        labelText: "Estado",
                        initialValue: userStore.stateField,
                        messageError: userStore.stateFieldError,
                        onChanged: userStore.setFieldState,
                      );
                    }),
                    const SizedBox(height: 16),
                    Observer(builder: (_) {
                      return DropdownCustom(
                        dropdownType: "Gênero",
                        labelText: "Gênero",
                        initialValue: userStore.genderField,
                        messageError: userStore.genderFieldError,
                        onChanged: userStore.setFieldGender,
                      );
                    }),
                    const SizedBox(height: 16),
                    Observer(builder: (context) {
                      return TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(),
                          filled: true,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        initialValue: userStore.email,
                        enabled: false,
                      );
                    }),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        await userStore.pressedSave().then((value) => {
                              userStore.isFormValid
                                  ? Navigator.pushNamedAndRemoveUntil(
                                      context, '/home', (route) => false)
                                  : null
                            });
                      },
                      child: const Text('Salvar'),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {
                        if (userStore.user == null) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        }
                      },
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
