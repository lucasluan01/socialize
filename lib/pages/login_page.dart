import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/stores/user_store.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = GetIt.instance<AuthService>();
    final userStore = GetIt.instance<UserStore>();

    // userStore.dispose();

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
                      await userStore.loadCurrentUserData();

                      if (userStore.user != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => false);
                      } else {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/profile');
                      }
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
