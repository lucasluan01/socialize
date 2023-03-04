class ContactModel {
  ContactModel({
    required this.id,
    required this.name,
    required this.photoUrl,
  });
  final String id, name;
  final String? photoUrl;

  ContactModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'photoUrl': photoUrl,
      };
}
