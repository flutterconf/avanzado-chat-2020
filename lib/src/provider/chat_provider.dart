import 'package:chat_flutter_in_the_dark/src/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum chatStates { fetching, error, fetched }

class ChatState extends ChangeNotifier {
  chatStates state = chatStates.fetching;
  List<ChatModel> chats;

  void fetchChats(){
    FirebaseFirestore.instance.collection('chats').snapshots();
  }

}
