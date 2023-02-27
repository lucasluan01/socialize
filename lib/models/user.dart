class User {
  User({
    required this.id,
    required this.name,
    required this.state,
    required this.email,
    required this.gender,
  });
  late final String id;
  late final String name;
  late final String state;
  late final String email;
  late final String gender;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state'] = state;
    data['email'] = email;
    data['gender'] = gender;
    return data;
  }
}
