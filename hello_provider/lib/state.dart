import 'package:flutter/material.dart';

class Todo with ChangeNotifier {
  List<String> tasks = ["aaa", "bbb"];

  void add(String text) {
    tasks.add(text);
    notifyListeners();
  }

  void edit(int index, newtext) {
    tasks[index] = newtext;
    notifyListeners();
  }

  void delete(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
