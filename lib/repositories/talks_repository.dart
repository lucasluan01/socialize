import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/auth/auth_service.dart';

class TalksRepository {
  final firestore = FirebaseFirestore.instance;
  final authService = GetIt.instance<AuthService>();

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> getNewTalks(
      String state) async {
    try {
      var talks = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isNotEqualTo: authService.currentUser!.uid)
          .where('state', isEqualTo: state)
          .get();

      return talks.docs;
    } catch (e) {
      rethrow;
    }
  }
}
