import 'package:angular_app/src/hero.dart';
import 'package:test/test.dart';

void main() {
  test('json化', () {
    final target = Hero(1, 'test');
    final actual = target.toJson();
    expect(actual, {'id': 1, 'name': 'test'});
  });
}