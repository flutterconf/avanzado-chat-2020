import 'package:chat_flutter_in_the_dark/src/core/viewmodel/view_model.dart';
import 'package:chat_flutter_in_the_dark/src/domain/models.dart';
import 'package:chat_flutter_in_the_dark/src/repositories/chats/interfaces.dart';

enum ChatListState {
  FETCHING_CHATS,
  FETCHED_CHATS,
  ERROR_FETCHING_CHATS,
}

class HomeViewModel extends ViewModel<ChatListState> {
  ChatRepository chatRepository;

  List<ChatModel> chatList;

  HomeViewModel(this.chatRepository);

  @override
  ChatListState initialState() {
    return ChatListState.FETCHING_CHATS;
  }

  Future fetchChats() async {
    setState(ChatListState.FETCHING_CHATS);
    execute(chatRepository.getChats(), onData: (chatList) {
      this.chatList = chatList;
      setState(ChatListState.FETCHED_CHATS);
    }, onError: (error) {
      setState(ChatListState.ERROR_FETCHING_CHATS);
    });
  }

  @override
  void destroy() {}
}
