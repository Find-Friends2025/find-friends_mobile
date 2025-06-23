import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_friends/data/chat/models/chat_message_request.dart';
import 'package:find_friends/data/chat/models/chat_message_response.dart';
import 'package:find_friends/data/chat/models/chat_room_response.dart';
import 'package:find_friends/domain/models/chat_message.dart';
import 'package:find_friends/domain/models/chat_room.dart';
import 'package:find_friends/domain/repository/chat_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final Dio _chatDio;
  final Dio _socketDio;

  static const String _roomId = "39f745df-c905-4feb-99aa-8216097c25a4";

  late final StompClient stompClient;
  Completer<StompUnsubscribe>? _subscriptionCompleter;
  StompMessageCallback? _storedCallback;

  ChatRepositoryImpl(
    @Named("api") this._chatDio,
    @Named("socket") this._socketDio,
  ) {
    stompClient = StompClient(
      config: StompConfig(
        url: "ws://3.37.20.26/ws",
        onConnect: _handleConnect,
        onWebSocketError: _handleWebSocketError,
        onDisconnect: (_) => _resetSubscription(),
        onStompError: (error) => print("❌ STOMP Error: ${error.body}"),
        onDebugMessage: (msg) => print("📦 Debug: $msg"),
        stompConnectHeaders: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0IiwidG9rZW5UeXBlIjoiYWNjZXNzVG9rZW4iLCJhdXRob3JpdHkiOiJVU0VSIiwiaWF0IjoxNzUwMDY0NDQ0LCJleHAiOjE3NTE4NjQ0NDR9.Uh4mp31i7p59PX6r0XKlKrzkpg9Z2arq99DGwokj7mc", // 추후 dotenv 등으로 처리 권장
        },
        heartbeatIncoming: const Duration(seconds: 30),
        heartbeatOutgoing: const Duration(seconds: 30),
        connectionTimeout: const Duration(seconds: 30),
      ),
    );
  }

  void _handleConnect(StompFrame frame) {
    if (_subscriptionCompleter?.isCompleted == false &&
        _storedCallback != null) {
      final unsubscribe = stompClient.subscribe(
        destination: "/topic/room/$_roomId",
        callback: (frame) {
          print(frame.body);
          final chatMessage = _parseMessage(frame.body);
          print(chatMessage);
          print(_storedCallback);
          if (chatMessage != null) _storedCallback?.call(chatMessage);
        },
      );
      _subscriptionCompleter?.complete(unsubscribe);
      // _storedCallback = null;
    }
  }

  void _handleWebSocketError(dynamic error) {
    if (_subscriptionCompleter?.isCompleted == false) {
      _subscriptionCompleter?.completeError(error);
    }
    _resetSubscription();
  }

  void _resetSubscription() {
    _subscriptionCompleter = null;
    _storedCallback = null;
  }

  ChatMessage? _parseMessage(String? body) {
    try {
      if (body == null) return null;
      final Map<String, dynamic> json = jsonDecode(body);
      return ChatMessageResponse.fromJson(json).toModel();
    } catch (e, stack) {
      print("🚨 Failed to parse message: $e\n$stack");
      return null;
    }
  }

  @override
  void sendMessage({
    required String roomId,
    required String message,
    required List<String> images,
  }) {
    stompClient.send(
      destination: "/app/chat.message",
      body: jsonEncode(
        ChatMessageRequest(
          roomId: roomId,
          message: message,
          images: images,
        ).toJson(),
      ),
    );
  }

  @override
  Future<StompUnsubscribe> subscribe(StompMessageCallback callback) async {
    print("🔌 WebSocket active: ${stompClient.isActive}");
    if (stompClient.isActive) {
      return stompClient.subscribe(
        destination: "/message",
        callback: (frame) {
          final message = _parseMessage(frame.body);
          if (message != null) callback(message);
        },
      );
    }

    await _chatDio.post("/chatroom/$_roomId/join-check");
    _storedCallback = callback;
    _subscriptionCompleter = Completer<StompUnsubscribe>();
    stompClient.activate();
    return _subscriptionCompleter!.future;
  }

  @override
  Future<List<ChatMessage>> loadMessage({
    required String chatRoomId,
    required String cursor,
    required int size,
  }) async {
    // TODO: 메시지 불러오기 구현 필요
    // return [];
    final response = await _socketDio.get<List<dynamic>>(
      "/message",
      queryParameters: {
        "chatRoomId": chatRoomId,
        "cursor": cursor,
        "size": size,
      },
    );
    return response.data!
        .map((item) => ChatMessageResponse.fromJson(item).toModel())
        .toList();
    await _chatDio.get("/chatroom/message");

    return [];
  }

  @override
  Future<List<ChatRoom>> loadRooms() async {
    final response = await _chatDio.get<List<dynamic>>("/chatroom");
    return response.data!
        .map((item) => ChatRoomResponse.fromJson(item).toModel())
        .toList();
  }
}
