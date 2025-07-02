import 'package:json_annotation/json_annotation.dart';

part 'search_user_request.g.dart';

@JsonSerializable(includeIfNull: false)
class SearchUserRequest {
  final int? age;
  final String? residence;
  final int? height;
  final String? bodyType;
  final bool? hasIntroduce;
  final bool? isNewUser;

  SearchUserRequest({
    this.age,
    this.residence,
    this.height,
    this.bodyType,
    this.hasIntroduce,
    this.isNewUser
  });

  factory SearchUserRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUserRequestToJson(this);

}
