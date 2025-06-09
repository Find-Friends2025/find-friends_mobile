import 'package:find_friends/data/firebase/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirebaseRepository)
class FirebaseRepositoryImpl extends FirebaseRepository {
  final _instance = FirebaseAuth.instance;

  Completer<String?>? _verificationIdCompleter;

  @override
  Future<String?> login({required String phoneNum}) async {
    _verificationIdCompleter?.complete(null);
    _verificationIdCompleter = Completer<String?>();

    await _instance.verifyPhoneNumber(
        phoneNumber: phoneNum,
        verificationCompleted: (PhoneAuthCredential credential) {

        },
        verificationFailed: (FirebaseAuthException e) {
          _verificationIdCompleter?.completeError(e);
        },
        codeSent: (String verificationId, int? resendToken) {

          _verificationIdCompleter?.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {

          _verificationIdCompleter?.complete(verificationId);
        }
    );

    return _verificationIdCompleter?.future;
  }

  @override
  Future<String?> credential({required String verificationId, required String smsCode}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    try {
      await _instance
          .signInWithCredential(credential)
          .then((value) {
        return value.credential?.accessToken;
      }).catchError((error) {
        throw error;
      });

      return null;
    } catch (e) {
      print("Credential 로그인 실패: $e");
      throw e;
    }
  }
}
