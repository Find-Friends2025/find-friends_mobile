import 'package:flutter/foundation.dart';


abstract class FirebaseRepository extends ChangeNotifier {

  Future<String?> login({required String phoneNum});

  Future<String?> credential({required String verificationId, required String smsCode});
}