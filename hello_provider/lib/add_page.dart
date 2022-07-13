import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state.dart';

class AddPage extends StatelessWidget {
  final ctrl = TextEditingController();
  AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: ctrl,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<Todo>().add(ctrl.text);
                Navigator.pop(context);
              },
              child: const Text("Add")),
        ],
      ),
    );
  }
}
