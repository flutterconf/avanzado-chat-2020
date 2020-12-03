part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class LoadMessages extends ChatEvent {}

class AddMessage extends ChatEvent {
  final MessageModel message;
  AddMessage(this.message);
}

class UpdateMessages extends ChatEvent {}

class ChatsUpdated extends ChatEvent {
  final List<ChatModel> chats;

  ChatsUpdated(this.chats);
}
