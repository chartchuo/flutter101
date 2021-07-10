import 'package:bloc/bloc.dart';
import 'package:bloc2021/event.dart';

import 'model.dart';

class TodoBloc extends Bloc<TodoEvent, Todo> {
  TodoBloc() : super(Todo());

  @override
  Stream<Todo> mapEventToState(TodoEvent event) async* {
    if (event is TodoAdd) {
      state.tasks.add(Task(event.name, false));
      yield state.clone();
    } else if (event is TodoDelete) {
      if (event.index < 0 || event.index >= state.tasks.length) return;
      state.tasks.removeAt(event.index);
      yield state.clone();
    } else if (event is TodoComplete) {
      state.tasks[event.index].complete = true;
      yield state.clone();
    }
  }
}
