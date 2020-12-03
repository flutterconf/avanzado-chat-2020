import 'package:chat_flutter_in_the_dark/src/domain/models.dart';

import 'interfaces.dart';

class ChatNetwork implements ChatRemote {

  @override
  Future<List<ChatModel>> getChats() {
    // TODO: implement getChats
  }

  @override
  Future<List<MessageModel>> getMessages(String id) {
    // TODO: implement getMessages
  }

  @override
  void sendMessage(String id, String text) {
    // TODO: implement sendMessage
  }
}
