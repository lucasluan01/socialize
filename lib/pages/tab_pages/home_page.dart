import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/pages/tab_pages/components/conversation_summary_custom.dart';
import 'package:socialize/stores/user_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userStore = GetIt.instance<UserStore>();
    userStore.loadConversationResume();

    return Observer(
      builder: (_) => ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (_, index) => const SizedBox(height: 16),
        padding: const EdgeInsets.all(16.0),
        itemCount: userStore.user!.contacts?.length ?? 0,
        itemBuilder: (_, index) {
          final conversation = userStore.user!.contacts;
          return ConversationSummaryCustom(
            contact: conversation![index],
          );
        },
      ),
    );
  }
}
