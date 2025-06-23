// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) =>
    ChatMessageResponse(
      id: json['id'] as String,
      chatRoomId: json['chatRoomId'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderProfileImage: json['senderProfileImage'] as String,
      message: json['message'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      sendAt: DateTime.parse(json['sendAt'] as String),
      messageStatus: $enumDecode(_$MessageStatusEnumMap, json['messageStatus']),
    );

Map<String, dynamic> _$ChatMessageResponseToJson(
  ChatMessageResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'chatRoomId': instance.chatRoomId,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'senderProfileImage': instance.senderProfileImage,
  'message': instance.message,
  'images': instance.images,
  'sendAt': instance.sendAt.toIso8601String(),
  'messageStatus': _$MessageStatusEnumMap[instance.messageStatus]!,
};

const _$MessageStatusEnumMap = {
  MessageStatus.SENT: 'SENT',
  MessageStatus.READ: 'READ',
  MessageStatus.DELETED: 'DELETED',
};
