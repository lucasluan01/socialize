import 'package:cloud_firestore/cloud_firestore.dart';

// TODO: Essa classe é realmente necessário ou pode ser usuado o UserRepository?
class ContactRepository {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('users');

  CollectionReference<Object?> getUsers() {
    return _userCollectionReference;
  }

  Future<void> updateContact(
      String contactID, Map<String, dynamic> lastMessage) {
    return _userCollectionReference.doc(contactID).update(lastMessage);
  }
}
