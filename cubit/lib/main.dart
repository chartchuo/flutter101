import 'package:cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'model.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(MaterialApp(
    home: BlocProvider(
        create: (context) {
          return TodoCubit(Todo());
        },
        child: Home()),
  ));
}

class Home extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TodoCubit, Todo>(
        builder: (context, todo) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: todo.tasks
                      .map((e) => ListTile(
                            title: Text(e.text),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                todoCubit.remove(e);
                              },
                            ),
                          ))
                      .toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: controller,
                  )),
                  TextButton(
                      onPressed: () {
                        todoCubit.add(Task(text: controller.text));
                        controller.clear();
                      },
                      child: Text('Add')),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
