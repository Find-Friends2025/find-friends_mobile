import 'package:find_friends/domain/models/chat_message.dart';
import 'package:find_friends/domain/models/user.dart';

final class ChatDetailState {
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final List<ChatMessage> messages;
  final User? myInfo;

  const ChatDetailState({
    this.isLoading = true,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.messages = const [],
    this.myInfo,
  });

  ChatDetailState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    List<ChatMessage>? messages,
    User? myInfo,
  }) {
    return ChatDetailState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      messages: messages ?? this.messages,
      myInfo: myInfo ?? this.myInfo,
    );
  }
}
