import 'package:json_annotation/json_annotation.dart';

part 'firebase_token_response.g.dart';

@JsonSerializable()
class FirebaseTokenResponse {
  final String token;
  final String uid;

  const FirebaseTokenResponse({
    required this.token,
    required this.uid
  });

  factory FirebaseTokenResponse.fromJson(Map<String, dynamic> json) => _$FirebaseTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseTokenResponseToJson(this);
}