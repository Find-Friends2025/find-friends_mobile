import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/auth/models/token_response.dart';
import 'package:find_friends/data/auth/repository/auth_repository.dart';
import 'package:find_friends/data/core/models/base_response.dart';
import 'package:find_friends/data/core/storage/token_storage.dart';
import 'package:find_friends/data/firebase/models/firebase_token_response.dart';
import 'package:find_friends/data/firebase/repository/firebase_repository.dart';
import 'package:find_friends/data/firebase/repository/firebase_repository_impl.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_event.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInViewModel extends Bloc<SignInEvent, SignInState> {
  final FirebaseRepository _firebaseRepository;
  final AuthRepository _authRepository;
  final TokenStorage _tokenStorage;

  SignInViewModel(
      this._firebaseRepository,
      this._authRepository,
      this._tokenStorage
  ) : super(SignInState.initial()) {
    on<SignInPhoneNumEdited>(_onPhoneNumEdited);
    on<SignInSmsCodeEdited>(_onSmsCodeEdited);
    on<SignInInit>(_initState);
    on<SignInSubmitted>(_onSubmitted);
    on<SignInVerify>(_onVerify);
  }

  void _onPhoneNumEdited(
    SignInPhoneNumEdited event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(phoneNum: event.phoneNum));
  }

  void _onSmsCodeEdited(SignInSmsCodeEdited event, Emitter<SignInState> emit) {
    emit(state.copyWith(smsCode: event.smsCode));
  }

  void _initState(SignInInit event, Emitter<SignInState> emit) {
    if (state.isSuccess) {
      emit(state.copyWith(isSuccess: false, isFailure: false, isSubmit: false));
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

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(isSubmit: true, isSuccess: false, isFailure: false));

    try {
      String? value = await _firebaseRepository.login(
        phoneNum: await formatPhoneNum(state.phoneNum),
      );

      emit(
        state.copyWith(verificationId: value, isSubmit: false, isSuccess: true),
      );
    } catch (e) {
      emit(state.copyWith(isSubmit: false, isFailure: true));
    }
  }

  Future<void> _onVerify(SignInVerify event, Emitter<SignInState> emit) async {
    emit(state.copyWith(isVerify: false));

    try {
      FirebaseTokenResponse? response = await _firebaseRepository.credential(
        verificationId: state.verificationId,
        smsCode: state.smsCode,
      );


      if (response == null) { return; }

      emit(state.copyWith(uid: response.uid, xToken: response.token));


      if (await _login(response.token, emit)) {
        emit(state.copyWith(isVerify: true));
      }
    } catch (e) {
      emit(state.copyWith(isLogin: false, isLoginFailed: true));
    }
  }

  Future<bool> _login(String xToken, Emitter<SignInState> emit) async {
    emit(state.copyWith(isLogin: true, isLoginFailed: false));

    BaseResponse<TokenResponse?> response = await _authRepository.login(xToken: xToken);

    if (response.data == null && response.status == HttpStatus.notFound) {
      emit(state.copyWith(isLogin: false, isLoginFailed: true));
      return false;
    }

    _tokenStorage.save(accessToken: response.data!.accessToken, refreshToken: response.data!.refreshToken);

    emit(state.copyWith(isLogin: false));

    return true;
  }
}
