import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/domain/enums/residence.dart';

class User {
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

  const User({
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
}
