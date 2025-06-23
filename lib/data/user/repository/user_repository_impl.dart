import 'package:dio/dio.dart';
import 'package:find_friends/data/core/models/base_response.dart';
import 'package:find_friends/data/user/models/user_response.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final Dio _dio;

  UserRepositoryImpl(@Named("api") this._dio);

  @override
  Future<User> getMyInfo() async {
    final response = await _dio.get<Map<String, dynamic>>("/user/me");
    return BaseResponse.fromJson(
      response.data!,
      (json) => UserResponse.fromJson(json as Map<String, dynamic>),
    ).data.toModel();
  }
}
