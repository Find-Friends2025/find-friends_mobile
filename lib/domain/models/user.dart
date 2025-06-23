class User {
  final int id;
  final String profilePicUrl;
  final String nickname;
  final int age;
  final String residence;
  final int? height;
  final String? bodyType;
  final String? introduce;
  final bool isOnline;
  final bool isLiked;

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
  });
}
