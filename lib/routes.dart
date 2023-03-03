import 'package:flutter/material.dart';
import 'package:socialize/pages/auth/login_page.dart';
import 'package:socialize/pages/chat_room/chat_room_page.dart';
import 'package:socialize/pages/profile/profile_page.dart';
import 'package:socialize/pages/splash_page.dart';
import 'package:socialize/pages/tab/tab_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    '/': (context) => const SplashPage(),
    '/login': (context) => const LoginPage(),
    '/profile': (context) => const ProfilePage(),
    '/home': (context) => const TabPage(),
    '/chat-room': (context) => const ChatRoomPage(),
  };
}
