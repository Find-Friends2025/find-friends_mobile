import 'package:find_friends/data/user/models/search_user_request.dart';
import 'package:find_friends/domain/models/user.dart';
import 'dart:io';
import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/domain/enums/residence.dart';
import 'package:find_friends/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getMyInfo();
  Future<String> uploadProfileImage(File image);
  Future<List<User>> getUsers(SearchUserRequest request);
  Future<void> patchMyInfo({
    required String profilePicUrl,
    required String nickname,
    required int age,
    Residence? residence,
    int? height,
    Gender? bodyType,
    String? introduce,
    String? birth,
  });
}
