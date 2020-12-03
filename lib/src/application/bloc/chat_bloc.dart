import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_flutter_in_the_dark/src/data/models/chat_model.dart';
import 'package:chat_flutter_in_the_dark/src/data/models/message_models.dart';
import 'package:chat_flutter_in_the_dark/src/data/repositiories/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  StreamSubscription _chatsSubscription;

  ChatBloc({@required ChatRepository chatRepository})
      : assert(chatRepository != null),
        _chatRepository = chatRepository,
        super(FetchingChats());

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is LoadMessages) {
      yield* _mapLoadMessagesToState(event);
    } else if (event is ChatsUpdated) {
      yield* _mapTodosUpdateToState(event);
    } else if (event is AddMessage) {
      yield* _mapAddMessage(event);
    }
  }

  Stream<ChatState> _mapLoadMessagesToState(LoadMessages event) async* {
    _chatsSubscription?.cancel();
    _chatsSubscription = _chatRepository.chats().listen(
          (chats) => add(ChatsUpdated(chats)),
        );
  }

  Stream<ChatState> _mapTodosUpdateToState(ChatsUpdated event) async* {
    yield FetchedChats(event.chats);
  }

  Stream<ChatState> _mapAddMessage(AddMessage event) async* {
    _chatRepository.addNewMessage(event.message);
  }
}
