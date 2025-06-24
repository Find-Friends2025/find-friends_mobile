import 'package:find_friends/domain/models/user.dart';
import 'dart:io';

abstract class UserRepository {
  Future<User> getMyInfo();
  Future<String> uploadProfileImage(File image);
}
