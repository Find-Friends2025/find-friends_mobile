import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:find_friends/domain/models/chat_message.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:find_friends/domain/repository/chat_repository.dart';
import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:find_friends/ui/chatdetail/model/chat_detail_event.dart';
import 'package:find_friends/ui/chatdetail/model/chat_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 1000);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@Injectable()
class ChatDetailViewModel extends Bloc<ChatDetailEvent, ChatDetailState> {
  final ChatRepository _chatRepository;
  final UserRepository _userRepository;

  ChatDetailViewModel(this._chatRepository, this._userRepository)
    : super(ChatDetailState()) {
    print("created");
    on<ChatDetailLoad>(_onLoad);
    on<ChatDetailLoadMore>(
      _onLoadMore,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ChatDetailSendMessage>(_onSendMessage);
    on<ChatDetailReceiveMessage>(_onReceiveMessage);
  }

  Future<void> _onLoad(
    ChatDetailLoad event,
    Emitter<ChatDetailState> emit,
  ) async {
    print("?");
    _chatRepository.subscribe((message) {
      add(ChatDetailReceiveMessage(message: message));
      // frame
    });
    final results = await Future.wait([
      _chatRepository.loadMessage(
        chatRoomId: "39f745df-c905-4feb-99aa-8216097c25a4",
        cursor: "",
        size: 20,
      ),
      _userRepository.getMyInfo(),
    ]);

    final messages = results[0] as List<ChatMessage>;
    final myInfo = results[1] as User;

    emit(state.copyWith(isLoading: false, messages: messages, myInfo: myInfo));
  }

  Future<void> _onLoadMore(
    ChatDetailLoadMore event,
    Emitter<ChatDetailState> emit,
  ) async {
    print("load more");
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final lastMessage = state.messages.lastOrNull;
    final cursor = lastMessage?.id ?? ""; // 적절한 cursor 사용

    final newMessages = await _chatRepository.loadMessage(
      chatRoomId: "39f745df-c905-4feb-99aa-8216097c25a4",
      cursor: cursor,
      size: 20,
    );

    emit(
      state.copyWith(
        isLoadingMore: false,
        messages: [...state.messages, ...newMessages],
        hasMore: newMessages.length == 20,
      ),
    );
  }

  void _onSendMessage(
    ChatDetailSendMessage event,
    Emitter<ChatDetailState> emit,
  ) {
    print("send message");
    _chatRepository.sendMessage(
      roomId: event.roomId,
      message: event.message,
      images: [],
    );
    // emit(
    //   state.copyWith(
    //     messages:
    //         state.messages..add(
    //           ChatMessage(
    //             id: "${Random.secure().nextInt(1000)}",
    //             chatRoomId: "chatRoomId",
    //             senderId: 3,
    //             senderName: "senderName",
    //             senderProfileImage:
    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc9APxkj0xClmrU3PpMZglHQkx446nQPG6lA&s",
    //             message: event.message,
    //             images: [],
    //             sendAt: DateTime.now(),
    //             messageStatus: MessageStatus.sent,
    //           ),
    //         ),
    //   ),
    // );
  }

  void _onReceiveMessage(
    ChatDetailReceiveMessage event,
    Emitter<ChatDetailState> emit,
  ) {
    emit(state.copyWith(messages: state.messages..insert(0, event.message)));
  }
}
