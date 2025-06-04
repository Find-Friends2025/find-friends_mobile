import 'package:find_friends/data/firebase/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final _instance = FirebaseAuth.instance;

  @override
  Future<String?> login({required String phoneNum}) async {
    String? verificationId;

    _instance.verifyPhoneNumber(
        phoneNumber: phoneNum,
        verificationCompleted: (PhoneAuthCredential credential) {
          print(verificationId);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("verificationFailed: $e");
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationId = verificationId;
          print("codeSent: $resendToken");
        },
        codeAutoRetrievalTimeout: (_) {

        }

    );

    return null;
  }

  @override
  Future<String?> credential({required String verificationId, required String smsCode}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    await _instance
        .signInWithCredential(credential)
        .then((value) {
          return value.credential?.accessToken;
        }).catchError((error) {
          print(error);
        });


    return null;

  }

}