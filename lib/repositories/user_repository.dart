import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('users');

  // TODO: Implementar no futuro
  CollectionReference<Object?> getUsers() {
    return _userCollectionReference;
  }

  Future<DocumentSnapshot<Object?>> getUser(String docID) {
    return _userCollectionReference.doc(docID).get();
  }

  Future<void> setUser(String docID, Map<String, dynamic> data) {
    return _userCollectionReference.doc(docID).set(data);
  }

  // TODO: Implementar no futuro
  // Future<void> deleteUser(DocumentSnapshot snapshot) {
  //   return snapshot.reference.delete();
  // }
}
