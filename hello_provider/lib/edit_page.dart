import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state.dart';

class EditPage extends StatelessWidget {
  final int index;
  final ctrl = TextEditingController();
  EditPage(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ctrl.text = context.read<Todo>().tasks[index];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: ctrl,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<Todo>().edit(index, ctrl.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<Todo>().delete(index);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
