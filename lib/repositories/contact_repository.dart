import 'package:cloud_firestore/cloud_firestore.dart';

class ContactRepository {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('users');

  CollectionReference<Object?> getUsers() {
    return _userCollectionReference;
  }
}
