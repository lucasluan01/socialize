import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  MessageModel({
    required this.idSender,
    required this.content,
    required this.shippingDate,
  });

  late final String? idSender;
  late final String content;
  late final Timestamp shippingDate;

  MessageModel.fromJson(Map<String, dynamic> json) {
    idSender = json['idSender'];
    content = json['content'];
    shippingDate = json['shippingDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idSender'] = idSender;
    data['content'] = content;
    data['shippingDate'] = shippingDate;
    return data;
  }
}
