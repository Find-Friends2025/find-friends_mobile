// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageRequest _$ChatMessageRequestFromJson(Map<String, dynamic> json) =>
    ChatMessageRequest(
      roomId: json['roomId'] as String,
      message: json['message'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChatMessageRequestToJson(ChatMessageRequest instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'message': instance.message,
      'images': instance.images,
    };
