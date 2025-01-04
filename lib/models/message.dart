enum MessageType { text, image, file }

class Message {
  final int user;
  final String description;
  final String sender;
  final MessageType type;
  final String? fileUrl;
  final String time;

  Message(this.user, this.description, this.sender,
      {this.type = MessageType.text, this.fileUrl, required this.time});
}