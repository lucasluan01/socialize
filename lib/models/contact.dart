class ContactModel {
  ContactModel({
    required this.idContact,
    required this.idChatRoom,
    this.name,
    this.photoUrl,
    this.lastMessage,
    this.lastMessageTime,
  });
  late String idContact;
  late String idChatRoom;
  late String? name;
  late String? lastMessage;
  late String? photoUrl;
  late DateTime? lastMessageTime;

  ContactModel.fromJson(Map<String, dynamic> json) {
    idContact = json['idContact'];
    name = json['name'];
    idChatRoom = json['idChatRoom'];
    photoUrl = json['photoUrl'];
    lastMessage = json['lastMessage'];
    lastMessageTime = json['lastMessageTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idContact'] = idContact;
    data['name'] = name;
    data['idChatRoom'] = idChatRoom;
    data['photoUrl'] = photoUrl;
    data['lastMessage'] = lastMessage;
    data['lastMessageTime'] = lastMessageTime;
    return data;
  }
}
