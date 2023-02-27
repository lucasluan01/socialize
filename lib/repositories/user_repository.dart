import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:socialize/auth/auth_service.dart';

class UserRepository {
  final authService = GetIt.instance<AuthService>();

  Future<Map<String, dynamic>?> getUser() async {
    if (authService.currentUser == null) return null;

    var user = await FirebaseFirestore.instance
        .collection('users')
        .doc(authService.currentUser!.uid)
        .get();
    return user.data();
  }

  // Future<void> createUser() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(authService.currentUser!.uid)
  //       .set({
  //     'name': authService.currentUser!.displayName,
  //     'email': authService.currentUser!.email,
  //     'photoUrl': authService.currentUser!.photoURL,
  //     'createdAt': DateTime.now(),
  //     'updatedAt': DateTime.now(),
  //   });
  // }

  Future<void> updateUser(Map<String, dynamic> data) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authService.currentUser!.uid)
          .update(data);
    } catch (e) {
      rethrow;
    }
  }
}
