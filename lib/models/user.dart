class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.state,
    this.photoUrl,
  });
  late String id, name, gender, state;
  String? photoUrl;

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        photoUrl = json['photoUrl'],
        gender = json['gender'],
        state = json['state'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'photoUrl': photoUrl,
        'gender': gender,
        'state': state,
      };
}
