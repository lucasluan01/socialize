import 'package:flutter/material.dart';
import 'package:socialize/pages/home_page.dart';
import 'package:socialize/pages/login_page.dart';
import 'package:socialize/pages/splash_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    '/': (context) => const SplashPage(),
    '/login': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
  };
}
