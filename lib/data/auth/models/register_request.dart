import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String uid;
  final String gender;
  final String birth;
  final String location;
  final String nickname;
  final String profilePicUrl;

  const RegisterRequest({
    required this.uid,
    required this.gender,
    required this.birth,
    required this.location,
    required this.nickname,
    required this.profilePicUrl
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}