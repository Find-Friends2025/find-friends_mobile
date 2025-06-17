import 'package:find_friends/data/firebase/models/firebase_token_response.dart';
import 'package:find_friends/data/firebase/repository/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirebaseRepository)
class FirebaseRepositoryImpl extends FirebaseRepository {
  final _instance = FirebaseAuth.instance;

  Completer<String?>? _verificationIdCompleter;
  Completer<FirebaseTokenResponse?>? _tokenCompleter;

  @override
  Future<String?> login({required String phoneNum}) async {
    _verificationIdCompleter?.complete(null);
    _verificationIdCompleter = Completer<String?>();

    await _instance.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        _verificationIdCompleter?.completeError(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationIdCompleter?.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationIdCompleter?.complete(verificationId);
      },
    );

    return _verificationIdCompleter?.future;
  }

  @override
  Future<FirebaseTokenResponse?> credential({
    required String verificationId,
    required String smsCode,
  }) async {
    _tokenCompleter?.complete(null);
    _tokenCompleter = Completer<FirebaseTokenResponse?>();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential).then((
        value,
      ) async {
        String? token = await value.user?.getIdToken();
        String? uid = value.user?.uid;

        if (token == null && uid == null) {
          throw Exception("토큰이나 uid 정보가 없습니다.");
        }

        _tokenCompleter?.complete(
          FirebaseTokenResponse(token: token!, uid: uid!),
        );
      });
    } catch (e) {
      _tokenCompleter?.completeError(e);
    }

    return _tokenCompleter?.future;
  }
}
