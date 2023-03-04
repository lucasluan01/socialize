class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.state,
    required this.photoUrl,
  });
  final String name, gender, state;
  late String id;
  String? photoUrl;

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        photoUrl = json['photoUrl'],
        gender = json['gender'],
        state = json['state'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
        'gender': gender,
        'state': state,
      };
}
