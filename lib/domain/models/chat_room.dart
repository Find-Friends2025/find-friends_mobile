final class ChatRoom {
  final String id;
  final String name;
  final String? lastMessageId;
  final String? lastMessage;
  final DateTime? lastMessageDate;
  final String profileImageUrl;
  final int unreadMessagesCount;

  ChatRoom({
    required this.id,
    required this.name,
    this.lastMessageId,
    this.lastMessage,
    this.lastMessageDate,
    required this.profileImageUrl,
    required this.unreadMessagesCount,
  });
}
