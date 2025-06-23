import 'package:find_friends/domain/models/chat_message.dart';
import 'package:find_friends/domain/models/chat_room.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

typedef StompMessageCallback = void Function(ChatMessage);

abstract class ChatRepository {
  Future<StompUnsubscribe> subscribe(StompMessageCallback callback);

  void sendMessage({
    required String roomId,
    required String message,
    required List<String> images,
  });

  Future<List<ChatMessage>> loadMessage({
    required String chatRoomId,
    required String cursor,
    required int size,
  });

  Future<List<ChatRoom>> loadRooms();
}
