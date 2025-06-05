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
    on<SignInSubmitted>(_onSubmitted);
  }

  void _onPhoneNumEdited(SignInPhoneNumEdited event, Emitter<SignInState> emit) {
    emit(state.copyWith(phoneNum: event.phoneNum));
  }

  Future<void> _onSubmitted(SignInSubmitted event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isSubmit: true, isSuccess: false, isFailure: false));
    
    try {

      String? value = await _firebaseRepository.login(phoneNum: state.phoneNum);

      print(value);

      emit(state.copyWith(isSubmit: false, isSuccess: true));
    } catch(e) {
      print(e.toString());

      emit(state.copyWith(
        isSubmit: false,
        isFailure: true
      ));
    }
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

class SignInState extends Equatable {
  final String phoneNum;
  final String smsCode;
  final String verificationId;

  final bool isSubmit;
  final bool isSuccess;
  final bool isFailure;

  const SignInState({
    required this.phoneNum,
    required this.smsCode,
    required this.verificationId,
    required this.isSubmit,
    required this.isSuccess,
    required this.isFailure
  });

  factory SignInState.initial() {
    return const SignInState(
      phoneNum: "",
      smsCode: "",
      verificationId: "",
      isSubmit: false,
      isSuccess: false,
      isFailure: false
    );
  }

  SignInState copyWith({
    String? phoneNum,
    String? smsCode,
    String? verificationId,
    bool? isSubmit,
    bool? isSuccess,
    bool? isFailure
  }) {
    return SignInState(
        phoneNum: phoneNum ?? this.phoneNum,
        smsCode: smsCode ?? this.smsCode,
        verificationId: verificationId ?? this.verificationId,
        isSubmit: isSubmit ?? this.isSubmit,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [phoneNum, smsCode, verificationId, isSubmit, isSuccess, isFailure];


}


