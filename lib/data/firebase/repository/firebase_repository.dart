import 'package:find_friends/data/firebase/models/firebase_token_response.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseRepository extends ChangeNotifier {

  Future<String?> login({required String phoneNum});

  Future<FirebaseTokenResponse?> credential({required String verificationId, required String smsCode});
}