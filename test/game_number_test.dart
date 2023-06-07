import 'package:flutter_demo/game_number.dart';
import 'package:test/test.dart';

void main() {
  test('less than 4 digits', () {
    expect(() => GameNumber("1"), throwsArgumentError);
  });

  test('has 4 digits', () {
    expect(() => GameNumber("1234"), returnsNormally);
  });

  test('more than 4 digits', () {
    expect(() => GameNumber("12345"), throwsArgumentError);
  });

  test('has non-numerical character', () {
    expect(() => GameNumber("1A2B"), throwsArgumentError);
  });
}
