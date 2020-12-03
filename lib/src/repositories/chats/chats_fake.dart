import 'package:chat_flutter_in_the_dark/src/domain/models.dart';

import 'interfaces.dart';

class ChatFake implements ChatRemote {
  @override
  Future<List<MessageModel>> getMessages(String id) {
    return Future.value(List<MessageModel>.generate(
      10,
      (i) => MessageModel(text: "Message $i"),
    ));
  }

  @override
  void sendMessage(String id, String text) {
    // TODO: implement sendMessage
  }

  @override
  Future<List<ChatModel>> getChats() {
    return Future.value(List<ChatModel>.generate(
      10,
          (i) => ChatModel(id: "id $i", title: "Chat Title $i"),
    ));
  }
}
