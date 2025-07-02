import 'package:equatable/equatable.dart';
import 'package:find_friends/data/user/models/search_user_request.dart';
import 'package:find_friends/domain/models/user.dart';

final class FindTieState extends Equatable {
  final List<User> userList;
  final SearchUserRequest request;

  FindTieState({required this.userList, required this.request});

  factory FindTieState.initial() {
    return FindTieState(userList: [], request: SearchUserRequest());
  }

  FindTieState copyWith({
    List<User>? userList,
    SearchUserRequest? request
  }) {
    return FindTieState(
      userList: userList ?? this.userList,
      request: request ?? this.request,
    );
  }

  @override
  List<Object?> get props => [userList, request];
}
