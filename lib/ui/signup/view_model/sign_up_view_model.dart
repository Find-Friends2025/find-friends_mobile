import 'package:bloc/bloc.dart';
import 'package:find_friends/data/auth/models/register_request.dart';
import 'package:find_friends/data/auth/models/token_response.dart';
import 'package:find_friends/data/auth/repository/auth_repository.dart';
import 'package:find_friends/data/core/models/base_response.dart';
import 'package:find_friends/data/core/storage/token_storage.dart';
import 'package:find_friends/ui/signup/models/sign_up_event.dart';
import 'package:find_friends/ui/signup/models/sign_up_state.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

@lazySingleton
class SignUpViewModel extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository;
  final TokenStorage _tokenStorage;

  SignUpViewModel(
      this._authRepository,
      this._tokenStorage
      ) : super(SignUpState.initial()) {
    on<SignUpGetPermission>(_getPermission);
    on<SignUpUidEdited>(_onUidEdited);
    on<SignUpGenderEdited>(_onGenderEdited);
    on<SignUpBirthEdited>(_onBirthEdited);
    on<SignUpResidenceEdited>(_onResidenceEdited);
    on<SignUpNickEdited>(_onNickEdited);
    on<SignUpRegister>(_register);
  }

  Future<void> _getPermission(
      SignUpGetPermission event,
      Emitter<SignUpState> emit
      ) async {
    var status = await Permission.contacts.status;

    if (status.isGranted) {
      print("이미 획득함");
      return;
    }

    await Permission.contacts.request();
  }

  void _onUidEdited(
      SignUpUidEdited event,
      Emitter<SignUpState> emit
      ) async {
    emit(state.copyWith(request: state.request.copyWith(uid: event.uid), xToken: event.xToken));
  }

  void _onGenderEdited(
      SignUpGenderEdited event,
      Emitter<SignUpState> emit
      ) async {
    emit(state.copyWith(request: state.request.copyWith(gender: event.gender)));
  }

  void _onBirthEdited(
      SignUpBirthEdited event,
      Emitter<SignUpState> emit
      ) async {
    DateTime date = event.date;
    emit(state.copyWith(request: state.request.copyWith(birth: DateFormat('yyyy-MM-dd').format(date)), birthDate: date));
  }

  void _onResidenceEdited(
      SignUpResidenceEdited event,
      Emitter<SignUpState> emit
      ) async {
    emit(state.copyWith(request: state.request.copyWith(location: event.residence)));
  }

  void _onNickEdited(
      SignUpNickEdited event,
      Emitter<SignUpState> emit
      ) async {
    emit(state.copyWith(request: state.request.copyWith(nickname: event.nick)));
  }

  Future<void> _register(
      SignUpRegister event,
      Emitter<SignUpState> emit
      ) async {
    emit(state.copyWith(isRegister: false));

    BaseResponse<TokenResponse?> response = await _authRepository.register(xToken: state.xToken, request: state.request);

    if (response.data == null) {
      emit(state.copyWith(isRegister: false));
      return;
    }

    _tokenStorage.save(accessToken: response.data!.accessToken, refreshToken: response.data!.refreshToken);

    emit(state.copyWith(isRegister: true));

  }
}
