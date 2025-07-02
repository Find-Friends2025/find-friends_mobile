abstract class SignUpEvent {}

class SignUpGetPermission extends SignUpEvent { }

class SignUpUidEdited extends SignUpEvent {
  final String uid;
  final String xToken;
  SignUpUidEdited(this.uid, this.xToken);
}

class SignUpGenderEdited extends SignUpEvent {
  final String gender;
  SignUpGenderEdited(this.gender);
}

class SignUpBirthEdited extends SignUpEvent {
  final DateTime date;
  SignUpBirthEdited(this.date);
}

class SignUpResidenceEdited extends SignUpEvent {
  final String residence;
  SignUpResidenceEdited(this.residence);
}

class SignUpNickEdited extends SignUpEvent {
  final String nick;
  SignUpNickEdited(this.nick);
}

class SignUpRegister extends SignUpEvent { }