import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  MessageModel({
    required this.senderID,
    required this.content,
    required this.sendedAt,
  });
  final String senderID;
  final String content;
  final Timestamp sendedAt;

  MessageModel.fromJson(Map<String, dynamic> json)
      : senderID = json['senderID'],
        content = json['content'],
        sendedAt = json['sendedAt'];

  Map<String, dynamic> toJson() => {
        'senderID': senderID,
        'content': content,
        'sendedAt': sendedAt,
      };
}
