import 'package:socialize/models/contact.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.state,
    required this.email,
    required this.gender,
    required this.contacts,
    this.photoUrl,
  });
  late final String id;
  late final String name;
  late final String? photoUrl;
  late final String state;
  late final String email;
  late final String gender;
  late final List<ContactModel>? contacts;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    state = json['state'];
    email = json['email'];
    gender = json['gender'];
    contacts = json['contacts']
        ?.map<ContactModel>((e) => ContactModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photoUrl'] = photoUrl;
    data['state'] = state;
    data['email'] = email;
    data['gender'] = gender;
    data['contacts'] = contacts?.map((e) => e.toJson()).toList();
    return data;
  }
}
