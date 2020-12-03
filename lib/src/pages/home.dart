import 'package:chat_flutter_in_the_dark/src/di/Injector.dart';
import 'package:chat_flutter_in_the_dark/src/domain/models.dart';
import 'package:chat_flutter_in_the_dark/src/pages/chat.dart';
import 'package:chat_flutter_in_the_dark/src/pages/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatListModel = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel(Injector.chatRepository);
});

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read(chatListModel).fetchChats();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTADO DE CHATS'),
        backgroundColor: Colors.lime[800],
      ),
      body: Consumer(
        builder: (ctx, watch, child) {
          HomeViewModel chatsModel = watch(chatListModel);
          switch (chatsModel.currentState) {
            case ChatListState.FETCHING_CHATS:
              return LoadingWidget();
            case ChatListState.FETCHED_CHATS:
              return ChatListWidget(
                chats: chatsModel.chatList,
              );
              break;
            case ChatListState.ERROR_FETCHING_CHATS:
              return ErrorWidget();
              break;
            default:
              return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error'));
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class ChatListWidget extends StatelessWidget {
  final List<ChatModel> chats;

  ChatListWidget({Key key, this.chats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(chat: chats[index])),
        ),
        child: Container(
          height: 100,
          color: Colors.lime[300],
          child: Center(
              child: Text(chats[index].title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
