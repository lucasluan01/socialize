import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/routes.dart';
import 'package:socialize/stores/user_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLocators();

  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton<AuthService>(AuthService());
  GetIt.I.registerSingleton<UserStore>(UserStore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(250, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            fixedSize: const Size(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.blue.shade50,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.black26,
            ),
          ),
        ),
      ),
      routes: Routes.appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
