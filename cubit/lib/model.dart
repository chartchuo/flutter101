class Task {
  String text;
  String status;
  Task({required this.text, this.status = 'normal'});
}

class Todo {
  late List<Task> tasks;
  Todo({List<Task>? initTasks}) {
    this.tasks = initTasks ?? [];
  }

  Todo.from(Todo old) {
    this.tasks = old.tasks;
  }
}
