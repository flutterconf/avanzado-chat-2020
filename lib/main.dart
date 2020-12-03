import 'package:chat_flutter_in_the_dark/src/app/error_app.dart';
import 'package:chat_flutter_in_the_dark/src/app/loaded_app.dart';
import 'package:chat_flutter_in_the_dark/src/app/loading_app.dart';
import 'package:chat_flutter_in_the_dark/src/application/bloc/chat_bloc.dart';
import 'package:chat_flutter_in_the_dark/src/data/repositiories/chat_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _initialization = Firebase.initializeApp();
    return BlocProvider(
      create: (context) => ChatBloc(chatRepository: ChatRepository())
        ..add(
          LoadMessages(),
        ),
      child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) return ErrorApp();

            if (snapshot.connectionState == ConnectionState.done)
              return ChatApp();

            return LoadingApp();
          }),
    );
  }
}
