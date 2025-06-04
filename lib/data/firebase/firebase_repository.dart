import 'package:flutter/foundation.dart';


abstract class FirebaseRepository extends ChangeNotifier {

  Future<void> login({required String phoneNum});

  Future<void> credential({required String verificationId, required String smsCode});
}