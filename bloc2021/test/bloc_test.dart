import 'package:bloc2021/bloc.dart';
import 'package:bloc2021/event.dart';
import 'package:bloc2021/model.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  blocTest<TodoBloc, Todo>(
    'Add',
    build: () => TodoBloc(),
    act: (bloc) {
      bloc.add(TodoAdd('aaa'));
      bloc.add(TodoAdd('bbb'));
      bloc.add(TodoAdd('ccc'));
    },
    verify: (bloc) {
      if (bloc.state.tasks.length != 3) throw ('Add error');
    },
  );
  blocTest<TodoBloc, Todo>(
    'Delete',
    build: () => TodoBloc(),
    act: (bloc) {
      bloc.add(TodoAdd('aaa'));
      bloc.add(TodoAdd('bbb'));
      bloc.add(TodoAdd('ccc'));
      bloc.add(TodoDelete(1));
    },
    verify: (bloc) {
      if (bloc.state.tasks.length != 2) throw ('Add error');
      if (bloc.state.tasks[1].name != 'ccc') throw ('Add error');
    },
  );
  blocTest<TodoBloc, Todo>(
    'Delete empty',
    build: () => TodoBloc(),
    act: (bloc) {
      bloc.add(TodoDelete(1));
    },
  );
  blocTest<TodoBloc, Todo>(
    'complete',
    build: () => TodoBloc(),
    act: (bloc) {
      bloc.add(TodoAdd('aaa'));
      bloc.add(TodoAdd('bbb'));
      bloc.add(TodoAdd('ccc'));
      bloc.add(TodoComplete(1));
    },
    verify: (bloc) {
      if (bloc.state.tasks[1].complete == false) {
        throw ('complete not true');
      }
    },
  );
}
