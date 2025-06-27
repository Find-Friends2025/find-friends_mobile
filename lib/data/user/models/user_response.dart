import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/domain/enums/residence.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final int id;
  final String profilePicUrl;
  final String nickname;
  final int age;
  final Residence? residence;
  final int? height;
  final Gender? bodyType;
  final String? introduce;
  final bool isOnline;
  final bool isLiked;
  final DateTime? birth;

  const UserResponse({
    required this.id,
    required this.profilePicUrl,
    required this.nickname,
    required this.age,
    required this.residence,
    required this.height,
    required this.bodyType,
    required this.introduce,
    required this.isOnline,
    required this.isLiked,
    this.birth,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  User toModel() => User(
    id: id,
    profilePicUrl: profilePicUrl,
    nickname: nickname,
    age: age,
    residence: residence,
    height: height,
    bodyType: bodyType,
    introduce: introduce,
    isOnline: isOnline,
    isLiked: isLiked,
    birth: birth,
  );
}
