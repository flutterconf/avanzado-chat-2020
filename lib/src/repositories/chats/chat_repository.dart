import 'package:chat_flutter_in_the_dark/src/domain/models.dart';
import 'package:chat_flutter_in_the_dark/src/repositories/chats/interfaces.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemote chatRemote;

  ChatRepositoryImpl(this.chatRemote);

  @override
  Future<List<ChatModel>> getChats() {
    return chatRemote.getChats();
  }

  @override
  Future<List<MessageModel>> getMessages(String id) {
   return chatRemote.getMessages(id);
  }

  @override
  void sendMessage(String id, String text) {
    return chatRemote.sendMessage(id, text);
  }
}
