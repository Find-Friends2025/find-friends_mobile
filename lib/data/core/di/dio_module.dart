import 'dart:io';

import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/core/storage/token_storage.dart';
import 'package:find_friends/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        baseUrl: dotenv.env["BASE_URL"]!,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000)
      )
    );

    dio.interceptors.add(authInterceptor);

    return dio;
  }
}

@lazySingleton
class AuthInterceptor extends Interceptor {
  final List<String> _excludedPaths = [
    "/auth/login",
    "/auth/reigster"
  ];

  final tokenStorage = getIt<TokenStorage>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("onRequest : ${options.path}");
    if (!_excludedPaths.any((path) => options.path.startsWith(path))) {
      final token = await tokenStorage.get();

      if (token != null) {
        options.headers['Authorization'] = 'Bearer ${token.accessToken}';
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {

      final token = await tokenStorage.get();

      if (token != null) {
        try {

          final newAccessToken = await _refreshAccessToken(token.refreshToken);

          await tokenStorage.saveOnlyAccess(accessToken: newAccessToken);

          final originalRequest = err.requestOptions;
          originalRequest.headers['Authorization'] = 'Bearer ${newAccessToken}';

          final response = await Dio().fetch(originalRequest);
          return handler.resolve(response);
        } catch (e) {
          tokenStorage.delete();
          goDefaultPage();
          return handler.reject(err);
        }
      }
    }

    super.onError(err, handler);
  }

  Future<String> _refreshAccessToken(String refreshToken) async {
    final dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL']!));

    final response = await dio
        .post("${dotenv.env["BASE_URL"]!}/auth/refresh", options: Options(
      headers: {
        "Authorization": refreshToken
      }
    ));

    if (response.statusCode == HttpStatus.ok) {
      return response.data['accessToken'];
    } else {
      throw Exception('Failed to refresh token');
    }
  }
}