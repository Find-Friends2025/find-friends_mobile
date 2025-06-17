import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final String phoneNum;
  final String smsCode;
  final String verificationId;

  final bool isSubmit;
  final bool isSuccess;
  final bool isFailure;
  final bool isVerify;

  final bool isLogin;
  final bool isLoginFailed;

  const SignInState({
    required this.phoneNum,
    required this.smsCode,
    required this.verificationId,
    required this.isSubmit,
    required this.isSuccess,
    required this.isFailure,
    required this.isVerify,
    required this.isLogin,
    required this.isLoginFailed,
  });

  factory SignInState.initial() {
    return const SignInState(
      phoneNum: "",
      smsCode: "",
      verificationId: "",
      isSubmit: false,
      isSuccess: false,
      isFailure: false,
      isVerify: false,
      isLogin: false,
      isLoginFailed: false,
    );
  }

  SignInState copyWith({
    String? phoneNum,
    String? smsCode,
    String? verificationId,
    bool? isSubmit,
    bool? isSuccess,
    bool? isFailure,
    bool? isVerify,
    bool? isLogin,
    bool? isLoginFailed,
  }) {
    return SignInState(
      phoneNum: phoneNum ?? this.phoneNum,
      smsCode: smsCode ?? this.smsCode,
      verificationId: verificationId ?? this.verificationId,
      isSubmit: isSubmit ?? this.isSubmit,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isVerify: isVerify ?? this.isVerify,
      isLogin: isLogin ?? this.isLogin,
      isLoginFailed: isLoginFailed ?? this.isLoginFailed,
    );
  }

  @override
  List<Object?> get props => [
    phoneNum,
    smsCode,
    verificationId,
    isSubmit,
    isSuccess,
    isFailure,
    isVerify,
    isLogin,
    isLoginFailed
  ];
}
