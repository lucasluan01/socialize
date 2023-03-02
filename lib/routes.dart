import 'package:flutter/material.dart';
import 'package:socialize/pages/chat/chat_page.dart';
import 'package:socialize/pages/tab_pages/tab_page.dart';
import 'package:socialize/pages/login_page.dart';
import 'package:socialize/pages/profile/profile_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    '/': (context) => const LoginPage(),
    '/home': (context) => const TabPage(),
    '/profile': (context) => const ProfilePage(),
    '/chat': (context) => const ChatPage(),
  };
}
