// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchUserRequest _$SearchUserRequestFromJson(Map<String, dynamic> json) =>
    SearchUserRequest(
      age: (json['age'] as num?)?.toInt(),
      residence: json['residence'] as String?,
      height: (json['height'] as num?)?.toInt(),
      bodyType: json['bodyType'] as String?,
      hasIntroduce: json['hasIntroduce'] as bool?,
      isNewUser: json['isNewUser'] as bool?,
    );

Map<String, dynamic> _$SearchUserRequestToJson(SearchUserRequest instance) =>
    <String, dynamic>{
      if (instance.age case final value?) 'age': value,
      if (instance.residence case final value?) 'residence': value,
      if (instance.height case final value?) 'height': value,
      if (instance.bodyType case final value?) 'bodyType': value,
      if (instance.hasIntroduce case final value?) 'hasIntroduce': value,
      if (instance.isNewUser case final value?) 'isNewUser': value,
    };
