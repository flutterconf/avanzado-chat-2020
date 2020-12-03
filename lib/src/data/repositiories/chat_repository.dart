import 'package:chat_flutter_in_the_dark/src/data/models/chat_model.dart';
import 'package:chat_flutter_in_the_dark/src/data/models/message_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  ChatRepository();

  final chatsCollection = FirebaseFirestore.instance.collection('chats');

  Future<void> addNewMessage(MessageModel message) {
    return chatsCollection.add(message.toDocument());
  }

  Stream<List<ChatModel>> chats() {
    return chatsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ChatModel.fromSnapshot(doc)).toList();
    });
  }
}
