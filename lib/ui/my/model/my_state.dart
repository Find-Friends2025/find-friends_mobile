import 'package:find_friends/domain/models/user.dart';

final class MyState {
  final User? myInfo;

  MyState({this.myInfo});

  MyState copyWith({User? myInfo}) {
    return MyState(myInfo: myInfo ?? this.myInfo);
  }
}
