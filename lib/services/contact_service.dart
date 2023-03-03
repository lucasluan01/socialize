import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialize/repositories/contact_repository.dart';

class ContactService {
  final _contactRepository = ContactRepository();

  Future<QuerySnapshot<Object?>> getUsers(String currentUserId, String state) {
    return _contactRepository
        .getUsers()
        .where('state', isEqualTo: state)
        .where(FieldPath.documentId, whereNotIn: [currentUserId, 'empty']).get();
  }
}
