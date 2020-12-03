import 'package:chat_flutter_in_the_dark/src/domain/models.dart';

abstract class ChatRepository {
  Future<List<ChatModel>> getChats();
  Future<List<MessageModel>> getMessages(String id);
  void sendMessage(String id, String text);
}

abstract class ChatRemote {
  Future<List<ChatModel>> getChats();
  Future<List<MessageModel>> getMessages(String id);
  void sendMessage(String id, String text);
}
