import 'package:bloc/bloc.dart';
import 'package:bloc2021/event.dart';

import 'model.dart';

class TodoBloc extends Bloc<TodoEvent, Todo> {
  TodoBloc() : super(Todo()) {
    on<TodoAdd>((event, emit) {
      state.tasks.add(Task(event.name, false));
      emit(state.clone());
    });
    on<TodoDelete>((event, emit) {
      if (event.index < 0 || event.index >= state.tasks.length) return;
      state.tasks.removeAt(event.index);
      emit(state.clone());
    });
    on<TodoComplete>((event, emit) {
      state.tasks[event.index].complete = true;
      emit(state.clone());
    });
  }

  // @override
  // Stream<Todo> mapEventToState(TodoEvent event) async* {
  //   if (event is TodoAdd) {
  //     state.tasks.add(Task(event.name, false));
  //     yield state.clone();
  //   } else if (event is TodoDelete) {
  //     if (event.index < 0 || event.index >= state.tasks.length) return;
  //     state.tasks.removeAt(event.index);
  //     yield state.clone();
  //   } else if (event is TodoComplete) {
  //     state.tasks[event.index].complete = true;
  //     yield state.clone();
  //   }
  // }
}
