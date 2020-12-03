import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class MessageModel {
  final String text;
  final String id;

  MessageModel({@required this.text, this.id});

  static MessageModel fromSnapshot(DocumentSnapshot snap) {
    return MessageModel(
      text: snap.data()['text'],
      id: snap.data()['id'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'text': text,
    };
  }
}
