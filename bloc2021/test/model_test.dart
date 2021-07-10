import 'package:test/test.dart';
import 'package:bloc2021/model.dart';

main() {
  test('self compare', () {
    var a = Todo();
    expect(a, a);
  });
  test('clone compare', () {
    var a = Todo();
    expect(a, isNot(a.clone()));
  });
}
