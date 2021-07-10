class TodoEvent {
  get parent => TodoEvent;
}

class TodoAdd extends TodoEvent {
  final String name;

  TodoAdd(this.name);
}

class TodoDelete extends TodoEvent {
  final int index;

  TodoDelete(this.index);
}

class TodoComplete extends TodoEvent {
  final int index;

  TodoComplete(this.index);
}
