import 'package:bloc/bloc.dart';
import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/firebase/firebase_repository.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_event.dart';
import 'package:find_friends/ui/signin/view_model/sign_in_state.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class SignInViewModel extends Bloc<SignInEvent, SignInState> {
  final FirebaseRepository _firebaseRepository;

  SignInViewModel()
      : _firebaseRepository = getIt<FirebaseRepository>(),
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



