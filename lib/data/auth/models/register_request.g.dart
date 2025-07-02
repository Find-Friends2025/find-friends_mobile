// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      uid: json['uid'] as String?,
      gender: json['gender'] as String?,
      birth: json['birth'] as String?,
      location: json['location'] as String?,
      nickname: json['nickname'] as String?,
      profilePicUrl: json['profilePicUrl'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'gender': instance.gender,
      'birth': instance.birth,
      'location': instance.location,
      'nickname': instance.nickname,
      'profilePicUrl': instance.profilePicUrl,
    };
