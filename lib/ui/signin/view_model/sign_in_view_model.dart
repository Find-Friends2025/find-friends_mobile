import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_friends/data/firebase/firebase_repository.dart';
import 'package:flutter/material.dart';


class SignInViewModel extends Bloc<SignInEvent, SignInState> {
  final FirebaseRepository _firebaseRepository;

  SignInViewModel({required FirebaseRepository repository})
      : _firebaseRepository = repository,
        super(SignInState.initial()) {
    on<SignInPhoneNumEdited>(_onPhoneNumEdited);
    on<SignInSmsCodeEdited>(_onSmsCodeEdited);
    on<SignInSubmitted>(_onSubmitted);
    on<SignInVerify>(_onVerify);
  }

  void _onPhoneNumEdited(SignInPhoneNumEdited event, Emitter<SignInState> emit) {
    emit(state.copyWith(phoneNum: event.phoneNum));
  }

  void _onSmsCodeEdited(SignInSmsCodeEdited event, Emitter<SignInState> emit) {
    emit(state.copyWith(phoneNum: event.smsCode));
  }

  Future<void> _onSubmitted(SignInSubmitted event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isSubmit: true, isSuccess: false, isFailure: false));
    
    try {
      String? value = await _firebaseRepository.login(phoneNum: await formatPhoneNum(state.phoneNum));


      emit(state.copyWith(verificationId: value, isSubmit: false, isSuccess: true));
    } catch(e) {
      print(e.toString());

      emit(state.copyWith(
        isSubmit: false,
        isFailure: true
      ));
    }
  }

  Future<void> _onVerify(SignInVerify event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isVerify: false));

    try {
      String? value = await _firebaseRepository.credential(verificationId: state.verificationId, smsCode: state.smsCode);

      print(value);
      emit(state.copyWith(isVerify: true));
    } catch(e) {
      print(e.toString());
    }
  }


  Future<String> formatPhoneNum(String phoneNum) async {
    String digitsOnly = phoneNum.replaceAll(RegExp(r'\D'), '');

    String prefixedDigits;

    if (digitsOnly.startsWith('82')) {
      prefixedDigits = '+$digitsOnly';
    } else if (digitsOnly.startsWith('0')) {
      prefixedDigits = '+82${digitsOnly.substring(1)}';
    } else {
      prefixedDigits = '+82$digitsOnly';
    }

    return prefixedDigits;

  }

}



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

class SignInState extends Equatable {
  final String phoneNum;
  final String smsCode;
  final String verificationId;

  final bool isSubmit;
  final bool isSuccess;
  final bool isFailure;
  final bool isVerify;

  const SignInState({
    required this.phoneNum,
    required this.smsCode,
    required this.verificationId,
    required this.isSubmit,
    required this.isSuccess,
    required this.isFailure,
    required this.isVerify
  });

  factory SignInState.initial() {
    return const SignInState(
      phoneNum: "",
      smsCode: "",
      verificationId: "",
      isSubmit: false,
      isSuccess: false,
      isFailure: false,
      isVerify: false
    );
  }

  SignInState copyWith({
    String? phoneNum,
    String? smsCode,
    String? verificationId,
    bool? isSubmit,
    bool? isSuccess,
    bool? isFailure,
    bool? isVerify
  }) {
    return SignInState(
        phoneNum: phoneNum ?? this.phoneNum,
        smsCode: smsCode ?? this.smsCode,
        verificationId: verificationId ?? this.verificationId,
        isSubmit: isSubmit ?? this.isSubmit,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        isVerify: isVerify ?? this.isVerify,
    );
  }

  @override
  List<Object?> get props => [phoneNum, smsCode, verificationId, isSubmit, isSuccess, isFailure];


}


