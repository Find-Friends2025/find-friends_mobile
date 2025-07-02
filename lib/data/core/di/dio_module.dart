import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/core/storage/token_storage.dart';
import 'package:find_friends/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @Named('api')
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        baseUrl: dotenv.env["BASE_URL"]!,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      ),
    );

    dio.interceptors.add(authInterceptor);
    dio.interceptors.add(
      LogInterceptor(requestHeader: true, responseBody: true),
    );

    return dio;
  }

  @Named('socket')
  @lazySingleton
  Dio dioForSocket(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        baseUrl: dotenv.env["SOCKET_URL"]!,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      ),
    );

    dio.interceptors.add(authInterceptor);
    dio.interceptors.add(
      LogInterceptor(requestHeader: true, responseBody: true),
    );

    return dio;
  }
}

@lazySingleton
class AuthInterceptor extends Interceptor {
  final List<String> _excludedPaths = ["/auth/login", "/auth/register"];

  final tokenStorage = getIt<TokenStorage>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    print("onRequest : ${options.path}");
    if (!_excludedPaths.any((path) => options.path.startsWith(path))) {
      final token = await tokenStorage.get();

      if (token != null) {
        options.headers['Authorization'] = 'Bearer ${token.accessToken}';
      }
    }
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0IiwidG9rZW5UeXBlIjoiYWNjZXNzVG9rZW4iLCJhdXRob3JpdHkiOiJVU0VSIiwiaWF0IjoxNzUwMDY0NDQ0LCJleHAiOjE3NTE4NjQ0NDR9.Uh4mp31i7p59PX6r0XKlKrzkpg9Z2arq99DGwokj7mc';

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

    final response = await dio.post(
      "${dotenv.env["BASE_URL"]!}/auth/refresh",
      options: Options(headers: {"Authorization": refreshToken}),
    );

    if (response.statusCode == HttpStatus.ok) {
      return response.data['accessToken'];
    } else {
      throw Exception('Failed to refresh token');
    }
  }
}
