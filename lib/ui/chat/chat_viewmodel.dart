import 'package:bloc/bloc.dart';
import 'package:find_friends/domain/repository/chat_repository.dart';
import 'package:find_friends/ui/chat/model/chat_event.dart';
import 'package:find_friends/ui/chat/model/chat_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatViewModel extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;

  ChatViewModel(this._chatRepository) : super(ChatState()) {
    on<ChatLoadEvent>(_onLoad);
  }

  void _onLoad(ChatEvent event, Emitter<ChatState> emit) async {
    emit(ChatState(rooms: await _chatRepository.loadRooms()));
  }
}
