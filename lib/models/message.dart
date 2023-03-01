class MessageModel {
  MessageModel({
    required this.idSender,
    required this.content,
    required this.shippingDate,
  });

  late final String idSender;
  late final String content;
  late final DateTime shippingDate;

  MessageModel.fromJson(Map<String, dynamic> json) {
    idSender = json['idSender'];
    content = json['content'];
    shippingDate = DateTime.parse(json['shippingDate'].toDate().toString());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idSender'] = idSender;
    data['content'] = content;
    data['shippingDate'] = shippingDate;
    return data;
  }
}
