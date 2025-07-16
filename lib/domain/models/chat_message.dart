import 'package:find_friends/domain/enums/message_status.dart';

final class ChatMessage {
  final String id;
  final String chatRoomId;
  final String senderId;
  final String senderName;
  final String senderProfileImage;
  final String message;
  final List<String> images;
  final DateTime sendAt;
  final MessageStatus messageStatus;

  ChatMessage({
    required this.id,
    required this.chatRoomId,
    required this.senderId,
    required this.senderName,
    required this.senderProfileImage,
    required this.message,
    required this.images,
    required this.sendAt,
    required this.messageStatus,
  });
}
