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
  residence: $enumDecodeNullable(_$ResidenceEnumMap, json['residence']),
  height: (json['height'] as num?)?.toInt(),
  bodyType: $enumDecodeNullable(_$GenderEnumMap, json['bodyType']),
  introduce: json['introduce'] as String?,
  isOnline: json['isOnline'] as bool,
  isLiked: json['isLiked'] as bool,
  birth: json['birth'] == null ? null : DateTime.parse(json['birth'] as String),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profilePicUrl': instance.profilePicUrl,
      'nickname': instance.nickname,
      'age': instance.age,
      'residence': _$ResidenceEnumMap[instance.residence],
      'height': instance.height,
      'bodyType': _$GenderEnumMap[instance.bodyType],
      'introduce': instance.introduce,
      'isOnline': instance.isOnline,
      'isLiked': instance.isLiked,
      'birth': instance.birth?.toIso8601String(),
    };

const _$ResidenceEnumMap = {
  Residence.SEOUL: 'SEOUL',
  Residence.GYEONGI: 'GYEONGI',
  Residence.PUSAN: 'PUSAN',
  Residence.DAEGU: 'DAEGU',
  Residence.INCHEON: 'INCHEON',
  Residence.GWANGJU: 'GWANGJU',
  Residence.DAEJEON: 'DAEJEON',
  Residence.ULSAN: 'ULSAN',
  Residence.SEJONG: 'SEJONG',
  Residence.GANGWON: 'GANGWON',
  Residence.NORTHCC: 'NORTHCC',
  Residence.SOUTHCC: 'SOUTHCC',
  Residence.NORTHJB: 'NORTHJB',
  Residence.SOUTHJB: 'SOUTHJB',
  Residence.NORTHKB: 'NORTHKB',
  Residence.SOUTHKB: 'SOUTHKB',
  Residence.JEJU: 'JEJU',
};

const _$GenderEnumMap = {Gender.M: 'M', Gender.W: 'W'};
