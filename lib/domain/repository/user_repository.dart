import 'package:find_friends/domain/models/user.dart';

abstract class UserRepository {
  Future<User> getMyInfo();
}
