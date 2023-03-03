class ContactModel {
  ContactModel({
    required this.id,
    required this.idChatRoom,
    required this.name,
    required this.photoUrl,
  });
  late String? idChatRoom;
  final String id, name;
  final String? photoUrl;

  ContactModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        idChatRoom = json['idChatRoom'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'idChatRoom': idChatRoom,
        'photoUrl': photoUrl,
      };
}
