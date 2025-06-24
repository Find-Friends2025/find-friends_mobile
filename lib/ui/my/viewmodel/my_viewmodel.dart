import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:find_friends/ui/my/model/my_event.dart';
import 'package:find_friends/ui/my/model/my_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyViewModel extends Bloc<MyEvent, MyState> {
  final UserRepository _userRepository;

  MyViewModel(this._userRepository) : super(MyState()) {
    on<MyLoadEvent>(_onLoad);
  }

  void _onLoad(MyLoadEvent event, Emitter<MyState> emit) async {
    final user = await _userRepository.getMyInfo();
    emit(state.copyWith(myInfo: user));
  }
}
