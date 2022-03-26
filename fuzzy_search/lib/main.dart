// ignore_for_file: prefer_const_constructors

import 'package:edit_distance/edit_distance.dart';
import 'package:flutter/material.dart';

import 'data.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var textCtl = TextEditingController();
  List<String> provinces = data.map((e) => e['province'] ?? '').toList();
  List<String> result = [];

  @override
  void initState() {
    super.initState();

    result = provinces;
  }

  void search() {
    Map<String, double> distance = {};
    var jaro = JaroWinkler();
    for (var p in provinces) {
      distance[p] = jaro.normalizedDistance(p, textCtl.text);
    }
    setState(() {
      result = provinces.where((p) => distance[p]! < 1.0).toList();
      result.sort(((a, b) {
        double da = distance[a] ?? 1;
        double db = distance[b] ?? 1;
        if (da > db) return 1;
        if (da < db) return -1;
        return 0;
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(controller: textCtl)),
                ElevatedButton(onPressed: search, child: Text('search')),
              ],
            ),
            Expanded(
              child: ListView(
                children: result.map((e) => ListTile(title: Text(e))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
