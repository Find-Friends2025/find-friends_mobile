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
    ""
  ];

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_excludedPaths.any((path) => options.path.startsWith(path))) {
      if ("token" != null) {
        options.headers['Authorization'] = 'Bearer ${"accessToken"}';
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {

      if ("token" != null) {
        try {


          final originalRequest = err.requestOptions;
          originalRequest.headers['Authorization'] = 'Bearer ${"accessToken"}';

          final response = await Dio().fetch(originalRequest);
          return handler.resolve(response);
        } catch (e) {
          return handler.reject(err);
        }
      }
    }
    super.onError(err, handler);
  }

  Future<String> _refreshAccessToken(String refreshToken) async {
    final dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL']!));

    final response = await dio
        .post("${""}/refresh", data: {'refreshToken': refreshToken});

    if (response.statusCode == 200) {
      return response.data['accessToken'];
    } else {
      throw Exception('Failed to refresh token');
    }
  }
}