import 'package:find_friends/data/core/storage/token_storage.dart';
import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:find_friends/ui/my/model/my_event.dart';
import 'package:find_friends/ui/my/model/my_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:find_friends/main.dart';


@injectable
class MyViewModel extends Bloc<MyEvent, MyState> {
  final UserRepository _userRepository;
  final TokenStorage _tokenStorage;

  MyViewModel(this._userRepository, this._tokenStorage) : super(MyState()) {
    on<MyLoadEvent>(_onLoad);
    on<MyLogOut>(_logout);
  }

  void _onLoad(MyLoadEvent event, Emitter<MyState> emit) async {
    final user = await _userRepository.getMyInfo();
    emit(state.copyWith(myInfo: user));
  }

  void _logout(MyLogOut event, Emitter<MyState> emit) async {
    await _tokenStorage.delete().then((value) async {
      goDefaultPage();
    });
  }
}
