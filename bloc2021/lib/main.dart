import 'package:bloc2021/bloc.dart';
import 'package:bloc2021/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model.dart';

void main() {
  runApp(BlocProvider<TodoBloc>(
    create: (BuildContext context) => TodoBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TodoBloc, Todo>(
        builder: (context, todo) {
          return Column(
            children: todo.tasks.map((e) => Text(e.name)).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<TodoBloc>(context).add(TodoAdd('New')),
        child: Icon(Icons.add),
      ),
    );
  }
}
