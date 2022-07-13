// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class Todo with ChangeNotifier {
  List<String> _tasks = ["aaa", "bbb"];
  List<String> get tasks => List.unmodifiable(_tasks);

  void add(String text) {
    _tasks.add(text);
    notifyListeners();
  }

  void edit(int index, newtext) {
    _tasks[index] = newtext;
    notifyListeners();
  }

  void delete(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
