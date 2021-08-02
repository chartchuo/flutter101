import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/user.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (res.statusCode == 200) {
      setState(() {
        var json = jsonDecode(res.body);
        for (var j in json) {
          users.add(User.fromJson(j));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: users
            .map((u) => ListTile(
                  title: Text(u.name ?? ''),
                  subtitle: Text(u.email ?? ''),
                ))
            .toList(),
      ),
    );
  }
}
