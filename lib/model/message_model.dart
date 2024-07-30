class MessageModel {
  String text;
  DateTime timestamp;
  bool isMyMessage;

  MessageModel(
      {required this.isMyMessage, required this.text, required this.timestamp});
}
