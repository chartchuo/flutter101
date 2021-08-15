import 'package:bloc/bloc.dart';
import 'model.dart';

class TodoCubit extends Cubit<Todo> {
  TodoCubit(Todo initialState) : super(initialState);

  void add(Task t) {
    state.tasks.add(t);
    emit(Todo.from(state));
  }

  void remove(Task t) {
    state.tasks.remove(t);
    emit(Todo.from(state));
  }
}
