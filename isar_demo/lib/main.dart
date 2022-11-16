import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'user.dart';

void main() async {
  final isar = await Isar.open([UserSchema]);
  runApp(MaterialApp(
    home: HomePage(isar),
  ));
}

class HomePage extends StatefulWidget {
  final Isar isar;
  const HomePage(this.isar, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Isar get isar => widget.isar;

  var newUser = User()
    ..id = 1
    ..name = 'Jane Doe'
    ..age = 36;

  void write() {
    isar.writeTxn(() async {
      await isar.users.put(newUser); // insert & update
    });
  }

  void read() {
    final existingUser = isar.users.getSync(newUser.id); // get
    print(existingUser?.id);
    print(existingUser?.name);
    print(existingUser?.age);
  }

  void delete() {
    isar.writeTxn(() async {
      await isar.users.delete(1); // delete
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => write(), child: const Text('write')),
            ElevatedButton(onPressed: () => read(), child: const Text('read')),
            ElevatedButton(
                onPressed: () => delete(), child: const Text('delete')),
          ],
        ),
      ),
    );
  }
}
