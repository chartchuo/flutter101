import 'package:test/test.dart';
import 'package:bloc2021/model.dart';

main() {
  test('clone compare test', () {
    var todo = Todo();
    var todoClone = todo.clone();
    expect(todo, isNot(todoClone));
  });
}
