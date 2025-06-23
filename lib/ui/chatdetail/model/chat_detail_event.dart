import 'package:find_friends/domain/models/chat_message.dart';

sealed class ChatDetailEvent {}

final class ChatDetailLoad extends ChatDetailEvent {}

final class ChatDetailLoadMore extends ChatDetailEvent {}

final class ChatDetailSendMessage extends ChatDetailEvent {
  final String message;
  final String roomId;

  ChatDetailSendMessage({required this.message, required this.roomId});
}

final class ChatDetailReceiveMessage extends ChatDetailEvent {
  final ChatMessage message;

  ChatDetailReceiveMessage({required this.message});
}
