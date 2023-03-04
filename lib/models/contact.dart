import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  ContactModel({
    required this.id,
    required this.name,
    required this.photoUrl,
  });
  final String id, name;
  final String? photoUrl;
  late Map<String, dynamic>? lastMessage;

  ContactModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        photoUrl = json['photoUrl'],
        lastMessage = json['lastMessage'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
        'lastMessage': lastMessage,
      };
}
