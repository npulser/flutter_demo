import 'package:flutter/foundation.dart';
import 'package:flutter_demo/digit.dart';
import 'package:flutter_demo/digit_match.dart';
import 'package:flutter_demo/game.dart';
import 'package:flutter_demo/game_number.dart';
import 'package:test/test.dart';

void main() {
  group('C: 1234', () {
    final challenge = GameNumber("1234");
    final game = Game(challenge);

    test('A: 1234', () {
      final answer = GameNumber("1234");
      final expected = [
        Digit('1', DigitMatch.hit),
        Digit('2', DigitMatch.hit),
        Digit('3', DigitMatch.hit),
        Digit('4', DigitMatch.hit),
      ];

      final result = game.guess(answer);

      expect(listEquals(expected, result), isTrue);
    });

    test('A: 5678', () {
      final answer = GameNumber("5678");
      final expected = [
        Digit('5', DigitMatch.wrong),
        Digit('6', DigitMatch.wrong),
        Digit('7', DigitMatch.wrong),
        Digit('8', DigitMatch.wrong),
      ];

      final result = game.guess(answer);

      expect(listEquals(expected, result), isTrue);
    });

    test('A: 4321', () {
      final answer = GameNumber("4321");
      final expected = [
        Digit('4', DigitMatch.miss),
        Digit('3', DigitMatch.miss),
        Digit('2', DigitMatch.miss),
        Digit('1', DigitMatch.miss),
      ];

      final result = game.guess(answer);

      expect(listEquals(expected, result), isTrue);
    });
  });

  group('C: 1132', () {
    final challenge = GameNumber("1132");
    final game = Game(challenge);

    test('A: 1234', () {
      final answer = GameNumber("1234");
      final expected = [
        Digit('1', DigitMatch.hit),
        Digit('2', DigitMatch.miss),
        Digit('3', DigitMatch.hit),
        Digit('4', DigitMatch.wrong),
      ];

      final result = game.guess(answer);

      expect(listEquals(expected, result), isTrue);
    });

    test('A: 1311', () {
      final answer = GameNumber("1311");
      final expected = [
        Digit('1', DigitMatch.hit),
        Digit('3', DigitMatch.miss),
        Digit('1', DigitMatch.miss),
        Digit('1', DigitMatch.wrong),
      ];

      final result = game.guess(answer);

      expect(listEquals(expected, result), isTrue);
    });
  });
}
