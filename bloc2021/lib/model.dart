class Task {
  String name;
  bool complete;

  Task(this.name, this.complete);
}

class Todo {
  late List<Task> tasks;

  Todo() {
    tasks = [];
  }

  Todo clone() {
    var n = Todo();
    n.tasks = tasks;
    return n;
  }
}
