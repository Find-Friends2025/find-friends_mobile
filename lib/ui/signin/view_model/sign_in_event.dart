import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {}

class SignInPhoneNumEdited extends SignInEvent {
  final String phoneNum;
  SignInPhoneNumEdited(this.phoneNum);

  @override
  List<Object> get props => [phoneNum];
}

class SignInSmsCodeEdited extends SignInEvent {
  final String smsCode;
  SignInSmsCodeEdited(this.smsCode);

  @override
  List<Object> get props => [smsCode];
}

class SignInSubmitted extends SignInEvent {
  SignInSubmitted();

  @override
  List<Object?> get props => [];

}

class SignInVerify extends SignInEvent {
  SignInVerify();

  @override
  List<Object?> get props => [];
}

