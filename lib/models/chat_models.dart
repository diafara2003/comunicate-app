import 'package:comunicate_colegios_app/models/person_models.dart';

class ChatDTO {
  final Usuario sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;
  final int id;
  final String asunto;
  final String sendTo;

  ChatDTO(
      {this.sender,
      this.time,
      this.text,
      this.isLiked,
      this.unread,
      this.id,
      this.asunto,
      this.sendTo});
}
