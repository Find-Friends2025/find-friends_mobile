import 'package:find_friends/domain/enums/message_status.dart';
import 'package:find_friends/domain/models/chat_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message_response.g.dart';

@JsonSerializable()
final class ChatMessageResponse {
  final String id;
  final String chatRoomId;
  final String senderId;
  final String senderName;
  final String senderProfileImage;
  final String message;
  final List<String> images;
  final DateTime sendAt;
  final MessageStatus messageStatus;

  ChatMessageResponse({
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

  Map<String, dynamic> toJson() => _$ChatMessageResponseToJson(this);

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);

  ChatMessage toModel() => ChatMessage(
    id: id,
    chatRoomId: chatRoomId,
    senderId: senderId,
    senderName: senderName,
    senderProfileImage: senderProfileImage,
    message: message,
    images: images,
    sendAt: sendAt,
    messageStatus: messageStatus,
  );
}
