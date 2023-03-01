class ContactModel {
  ContactModel({
    required this.idContact,
    required this.nickname,
    required this.idChatRoom,
  });
  late final String idContact;
  late final String nickname;
  late final String idChatRoom;
  
  ContactModel.fromJson(Map<String, dynamic> json){
    idContact = json['idContact'];
    nickname = json['nickname'];
    idChatRoom = json['idChatRoom'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idContact'] = idContact;
    data['nickname'] = nickname;
    data['idChatRoom'] = idChatRoom;
    return data;
  }
}