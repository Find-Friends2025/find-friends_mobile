import 'package:find_friends/data/auth/models/token_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

final _dgSecureStorage = FlutterSecureStorage(
  aOptions: AndroidOptions(
    encryptedSharedPreferences: true
  )
);


@lazySingleton
class TokenStorage {
  static const String _accessTokenKey = "accessTokenKey";
  static const String _refreshTokenKey = "refreshTokenKey";

  Future<void> save({
    required String accessToken,
    required String refreshToken
  }) async {
    _dgSecureStorage.write(
        key: _accessTokenKey,
        value: accessToken
    );
    _dgSecureStorage.write(
        key: _refreshTokenKey,
        value: refreshToken
    );
  }

  Future<TokenResponse?> get() async {
    final accessToken = await _dgSecureStorage.read(key: _accessTokenKey);
    final refreshToken = await _dgSecureStorage.read(key: _refreshTokenKey);

    if (accessToken == null || refreshToken == null) {
      return null;
    }
    return TokenResponse(
      accessToken: accessToken,
      refreshToken: refreshToken
    );
  }

  Future<void> saveOnlyAccess({required String accessToken}) async {
    await _dgSecureStorage.write(
      key: _accessTokenKey,
      value: accessToken,
    );
  }

  Future<void> delete() async {
    await _dgSecureStorage.delete(key: _accessTokenKey);
    await _dgSecureStorage.delete(key: _refreshTokenKey);
  }

}