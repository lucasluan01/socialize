import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        // ContactCustom(),
        // ContactCustom(),
        // ContactCustom(),
        // ContactCustom(),
        // ContactCustom(),
      ],
    );
  }
}