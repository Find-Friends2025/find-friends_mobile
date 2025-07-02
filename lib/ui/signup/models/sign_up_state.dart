import 'package:equatable/equatable.dart';
import 'package:find_friends/data/auth/models/register_request.dart';

class SignUpState extends Equatable {
  final RegisterRequest request;
  final DateTime? birthDate;
  final bool isRegister;
  final String xToken;

  const SignUpState({
    required this.request,
    this.birthDate,
    required this.isRegister,
    required this.xToken
  });

  factory SignUpState.initial() {
    return SignUpState(
        request: RegisterRequest(
          profilePicUrl: ""
        ),
      isRegister: false,
      xToken: ""
    );
  }

  SignUpState copyWith({
    RegisterRequest? request,
    DateTime? birthDate,
    bool? isRegister,
    String? xToken
  }) {
    return SignUpState(
        request: request ?? this.request,
      birthDate: birthDate ?? this.birthDate,
      isRegister: isRegister ?? this.isRegister,
      xToken: xToken ?? this.xToken
    );
  }

  @override
  List<Object?> get props => [
    request,
    birthDate,
    isRegister,
    xToken
  ];
}