class ChatRoomModel {
  ChatRoomModel({
    required this.usersID,
    required this.type,
    required this.groupID,
  });
  final List<String> usersID;
  final String type;
  late String? groupID;
  late Map<String, dynamic>? lastMessage;

  ChatRoomModel.fromJson(Map<String, dynamic> json)
      : usersID = json['usersID'].cast<String>(),
        type = json['type'],
        groupID = json['groupID'],
        lastMessage = json['lastMessage'];

  Map<String, dynamic> toJson() => {
        'usersID': usersID,
        'type': type,
        'groupID': groupID,
      };
}
