// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  id: json['id'] as int,
  profilePicUrl: json['profilePicUrl'] as String,
  nickname: json['nickname'] as String,
  age: json['age'] as int,
  residence: json['residence'] == null
      ? null
      : Residence.values.firstWhere((e) => e.toString() == 'Residence.' + json['residence']),
  height: json['height'] as int?,
  bodyType: json['bodyType'] == null
      ? null
      : Gender.values.firstWhere((e) => e.toString() == 'Gender.' + json['bodyType']),
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
      'residence': instance.residence?.toString().split('.').last,
      'height': instance.height,
      'bodyType': instance.bodyType?.toString().split('.').last,
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
