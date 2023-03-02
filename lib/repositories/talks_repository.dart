import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/auth/auth_service.dart';
import 'package:socialize/stores/user_store.dart';

class TalksRepository {
  final firestore = FirebaseFirestore.instance;
  final authService = GetIt.instance<AuthService>();
  final user = GetIt.instance<UserStore>();

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getNewTalks(
      String state) async {
    try {
      var talks = await FirebaseFirestore.instance
          .collection('users')
          .where('id', whereNotIn: [
            authService.currentUser!.uid,
            ...user.user?.contacts?.map((e) => e.idContact).toList() ?? [],
            'empty'
          ])
          .where('state', isEqualTo: state)
          .get();

      return talks.docs;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> createNewRoom() async {
    try {
      return await firestore.collection('chat_rooms').add({
        // TODO: utilizar lastMessage no futuro
        'lastMessage': 'Última mensagem',
        'lastMessageTime': DateTime.now(),
      }).then((value) {
        value.collection('messages').doc('empty').set({});
        return value.id;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createNewContact(String id, String idNewChat) async {
    try {
      await firestore
          .collection('users')
          .doc(authService.currentUser!.uid)
          .collection('contacts')
          .doc(id)
          .set({'idContact': id, 'idChatRoom': idNewChat});
    } catch (e) {
      inspect(e);
    }
  }
}
