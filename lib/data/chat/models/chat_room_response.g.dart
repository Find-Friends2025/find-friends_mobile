// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomResponse _$ChatRoomResponseFromJson(Map<String, dynamic> json) =>
    ChatRoomResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      lastMessageId: json['lastMessageId'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastMessageDate:
          json['lastMessageDate'] == null
              ? null
              : DateTime.parse(json['lastMessageDate'] as String),
      profileImageUrl: json['profileImageUrl'] as String,
      unreadMessagesCount: (json['unreadMessagesCount'] as num).toInt(),
    );

Map<String, dynamic> _$ChatRoomResponseToJson(ChatRoomResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastMessageId': instance.lastMessageId,
      'lastMessage': instance.lastMessage,
      'lastMessageDate': instance.lastMessageDate?.toIso8601String(),
      'profileImageUrl': instance.profileImageUrl,
      'unreadMessagesCount': instance.unreadMessagesCount,
    };
