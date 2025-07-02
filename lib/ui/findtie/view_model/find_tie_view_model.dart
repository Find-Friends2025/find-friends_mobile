import 'package:bloc/bloc.dart';
import 'package:find_friends/data/user/models/search_user_request.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:find_friends/ui/findtie/models/find_tie_event.dart';
import 'package:find_friends/ui/findtie/models/find_tie_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FindTieViewModel extends Bloc<FindTieEvent, FindTieState> {
  final UserRepository _userRepository;

  FindTieViewModel(this._userRepository) : super(FindTieState.initial()) {
    on<FindTieLoadEvent>(_loadUsers);
    on<FindTieSearchUsers>(_searchUsers);
  }

  Future<void> _loadUsers(
      FindTieLoadEvent event,
      Emitter<FindTieState> emit
      ) async {
    await _getUsers(emit: emit, request: SearchUserRequest());
  }



  Future<void> _searchUsers(
      FindTieSearchUsers event,
      Emitter<FindTieState> emit
      ) async {
    await _getUsers(emit: emit, request: state.request);
  }


  Future<void> _getUsers({
    required Emitter<FindTieState> emit,
    SearchUserRequest? request
  }) async {
    List<User> response = await _userRepository.getUsers(request ?? state.request);

    print(response);
    emit(state.copyWith(userList: response));

  }
}
