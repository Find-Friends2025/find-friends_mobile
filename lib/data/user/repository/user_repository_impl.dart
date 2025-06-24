import 'package:dio/dio.dart';
import 'package:find_friends/data/core/models/base_response.dart';
import 'package:find_friends/data/user/models/user_response.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';

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

  @override
  Future<String> uploadProfileImage(File image) async {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
    });
    final response = await _dio.post<Map<String, dynamic>>(
      '/image/upload',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return BaseResponse.fromJson(
      response.data!,
      (json) => json as String,
    ).data;
  }
}
