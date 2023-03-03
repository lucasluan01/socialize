class ContactModel {
  ContactModel({
    required this.idChatRoom,
    required this.name,
    required this.photoUrl,
  });
  late String? idChatRoom;
  final String name;
  final String? photoUrl;

  ContactModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        idChatRoom = json['idChatRoom'],
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'idChatRoom': idChatRoom,
        'photoUrl': photoUrl,
      };
}
