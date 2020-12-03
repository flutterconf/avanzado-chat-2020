import 'package:chat_flutter_in_the_dark/src/models/chat_model.dart';
import 'package:chat_flutter_in_the_dark/src/pages/chat.dart';
import 'package:chat_flutter_in_the_dark/src/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LISTADO DE CHATS'), backgroundColor: Colors.lime[800],),
      body: Builder(
        builder: (context) {
          context.watch<ChatState>().fetchChats();
          List<ChatModel> chats = context.watch<ChatState>().chats;
          chatStates state = context.watch<ChatState>().state;
          if (state == chatStates.fetching) return Center(child: CircularProgressIndicator());
          if (state == chatStates.error) return Center(child: Text('Error'));
          if (state == chatStates.fetched)
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
                      child:
                          Text(chats[index].title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                ),
              ),
            );
          return SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
