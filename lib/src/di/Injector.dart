import 'package:chat_flutter_in_the_dark/src/repositories/chats/chat_repository.dart';
import 'package:chat_flutter_in_the_dark/src/repositories/chats/chats_fake.dart';
import 'package:chat_flutter_in_the_dark/src/repositories/chats/interfaces.dart';

class Injector {
  static final ChatRepository chatRepository = ChatRepositoryImpl(ChatFake());
}