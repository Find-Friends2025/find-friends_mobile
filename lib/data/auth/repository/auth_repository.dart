import 'package:find_friends/data/auth/models/register_request.dart';
import 'package:find_friends/data/auth/models/token_response.dart';
import 'package:find_friends/data/core/models/base_response.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRepository extends ChangeNotifier {

  Future<BaseResponse<TokenResponse?>> register({required String xToken, required RegisterRequest request});

  Future<String?> refresh();

  Future<BaseResponse<TokenResponse?>> login({required String xToken});
}