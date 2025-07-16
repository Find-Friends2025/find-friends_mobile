import 'package:find_friends/domain/models/chat_room.dart';

final class ChatState {
  final List<ChatRoom> rooms;

  const ChatState({this.rooms = const []});
}
