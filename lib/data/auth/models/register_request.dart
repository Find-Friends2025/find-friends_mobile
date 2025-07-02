import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  final String? uid;
  final String? gender;
  final String? birth;
  final String? location;
  final String? nickname;
  final String? profilePicUrl;

  const RegisterRequest({
    this.uid,
    this.gender,
    this.birth,
    this.location,
    this.nickname,
    this.profilePicUrl
  });

  RegisterRequest copyWith({
    String? uid,
    String? gender,
    String? birth,
    String? location,
    String? nickname,
    String? profilePicUrl
  }) {
    return RegisterRequest(
        uid: uid ?? this.uid,
        gender: gender ?? this.gender,
      birth: birth ?? this.birth,
      location: location ?? this.location,
      nickname: nickname ?? this.nickname,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl
    );
  }


  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  List<Object?> get props => [
    uid,
    gender,
    birth,
    location,
    nickname,
    profilePicUrl
  ];
}