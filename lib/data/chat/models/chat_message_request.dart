import 'package:json_annotation/json_annotation.dart';

part 'chat_message_request.g.dart';

@JsonSerializable()
class ChatMessageRequest {
  final String roomId;
  final String message;
  final List<String> images;

  ChatMessageRequest({
    required this.roomId,
    required this.message,
    required this.images,
  });

  Map<String, dynamic> toJson() => _$ChatMessageRequestToJson(this);

  ChatMessageRequest fromJson(Map<String, dynamic> json) =>
      _$ChatMessageRequestFromJson(json);
}
