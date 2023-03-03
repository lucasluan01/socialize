import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/stores/user_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = GetIt.instance<AuthService>();
  final userStore = GetIt.instance<UserStore>();

  @override
  void initState() {
    super.initState();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              SvgPicture.asset('assets/logo/logo.svg'),
              const Spacer(),
              Observer(builder: (_) {
                return OutlinedButton(
                  onPressed: () async {
                    await authService.signInwithGoogle();

                    if (authService.currentUser != null) {
                      await userStore.getUser().then((_) {
                        if (userStore.user != null) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        } else {
                          Navigator.pushNamed(context, '/profile');
                        }
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/google.svg"),
                      const SizedBox(width: 12),
                      const Text(
                        "Continuar com Google",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
