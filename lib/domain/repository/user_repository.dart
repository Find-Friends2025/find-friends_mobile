import 'package:find_friends/data/user/models/search_user_request.dart';
import 'package:find_friends/domain/models/user.dart';
import 'dart:io';

abstract class UserRepository {
  Future<User> getMyInfo();
  Future<String> uploadProfileImage(File image);
  Future<List<User>> getUsers(SearchUserRequest request);
}
