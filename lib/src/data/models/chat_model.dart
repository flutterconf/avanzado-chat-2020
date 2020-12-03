import 'package:chat_flutter_in_the_dark/src/data/models/message_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class ChatModel {
  final String id;
  final String title;
  final List<MessageModel> chats;
  ChatModel({
    @required this.id,
    @required this.title,
    @required this.chats,
  });

  static ChatModel fromSnapshot(DocumentSnapshot snap) {
    return ChatModel(
      id: snap.data()['id'],
      title: snap.data()['title'],
      chats: getMessages(snap.data()['chats']),
    );
  }

  static List<MessageModel> getMessages(List<dynamic> chats) {
    List<MessageModel> tempChats;
    for (final chat in chats) {
      tempChats.add(MessageModel.fromSnapshot(chat));
    }
    return tempChats;
  }

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'chats': {
        for (final chat in chats)
          {
            chat.toDocument(),
          }
      }
    };
  }
}
