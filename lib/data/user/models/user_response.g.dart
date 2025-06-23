// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  id: (json['id'] as num).toInt(),
  profilePicUrl: json['profilePicUrl'] as String,
  nickname: json['nickname'] as String,
  age: (json['age'] as num).toInt(),
  residence: json['residence'] as String,
  height: (json['height'] as num?)?.toInt(),
  bodyType: json['bodyType'] as String?,
  introduce: json['introduce'] as String?,
  isOnline: json['isOnline'] as bool,
  isLiked: json['isLiked'] as bool,
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profilePicUrl': instance.profilePicUrl,
      'nickname': instance.nickname,
      'age': instance.age,
      'residence': instance.residence,
      'height': instance.height,
      'bodyType': instance.bodyType,
      'introduce': instance.introduce,
      'isOnline': instance.isOnline,
      'isLiked': instance.isLiked,
    };
