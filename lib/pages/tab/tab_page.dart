import 'package:flutter/material.dart';
import 'package:socialize/pages/home/home_page.dart';
import 'package:socialize/pages/tab/components/appbar_custom.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarCustom(),
        body: TabBarView(
          children: [
            HomePage(),
            Center(
              child: Text('Chat Page'),
            ),
          ],
        ),
      ),
    );
  }
}
