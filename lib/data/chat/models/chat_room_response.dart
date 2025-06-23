import 'package:find_friends/domain/models/chat_room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_room_response.g.dart';

@JsonSerializable()
final class ChatRoomResponse {
  final String id;
  final String name;
  final String? lastMessageId;
  final String? lastMessage;
  final DateTime? lastMessageDate;
  final String profileImageUrl;
  final int unreadMessagesCount;

  ChatRoomResponse({
    required this.id,
    required this.name,
    required this.lastMessageId,
    required this.lastMessage,
    required this.lastMessageDate,
    required this.profileImageUrl,
    required this.unreadMessagesCount,
  });

  factory ChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomResponseToJson(this);

  ChatRoom toModel() => ChatRoom(
    id: id,
    name: name,
    lastMessageId: lastMessageId,
    lastMessage: lastMessage,
    lastMessageDate: lastMessageDate,
    profileImageUrl: profileImageUrl,
    unreadMessagesCount: unreadMessagesCount,
  );
}
