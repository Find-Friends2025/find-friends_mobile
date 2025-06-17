import 'package:dio/dio.dart';
import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/auth/repository/auth_repository.dart';
import 'package:find_friends/data/auth/models/register_request.dart';
import 'package:find_friends/data/auth/models/token_response.dart';
import 'package:find_friends/data/core/models/base_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final _dio = getIt<Dio>();
  final prefix = "/auth";

  @override
  Future<BaseResponse<TokenResponse?>> login({required String xToken}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      "$prefix/login",
      options: Options(headers: {"X-firebase-token": xToken}),
    );

    try {
      BaseResponse<TokenResponse> decodedResponse = BaseResponse.fromJson(
        response.data!,
        (json) => TokenResponse.fromJson(json as Map<String, dynamic>),
      );

      return decodedResponse;
    } catch (e) {
      return BaseResponse<TokenResponse?>(status: response.statusCode ?? 400, message: "디코딩에 실패했습니다.", data: null);
    }
  }

  @override
  Future<String?> refresh() {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<TokenResponse?>> register({
    required String xToken,
    required RegisterRequest request,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      "$prefix/register",
      data: request.toJson(),
      options: Options(headers: {"X-firebase-token": xToken}),
    );

    try {
      BaseResponse<TokenResponse> decodedResponse = BaseResponse.fromJson(
        response.data!,
        (json) => TokenResponse.fromJson(json as Map<String, dynamic>),
      );

      return decodedResponse;
    } catch (e) {
      return BaseResponse<TokenResponse?>(status: response.statusCode ?? 400, message: "디코딩에 실패했습니다.", data: null);
    }
  }
}
