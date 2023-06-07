import 'package:flutter_demo/digit_match.dart';

import 'digit.dart';
import 'game_number.dart';

class Game {
  final GameNumber challenge;

  Game(this.challenge);

  List<Digit> guess(GameNumber answer) {
    final challengeDigits = challenge.digits;
    final answerDigits = answer.digits;
    final length = answerDigits.length;
    final result = List.filled(length, DigitMatch.wrong);

    for (var i = 0; i < length; i++) {
      if (challengeDigits[i] == answerDigits[i]) {
        result[i] = DigitMatch.hit;
      }
    }

    for (var i = 0; i < length; i++) {
      if (result[i] == DigitMatch.hit) {
        continue;
      }

      for (var j = 0; j < length; j++) {
        if (result[j] != DigitMatch.wrong) {
          continue;
        }

        if (challengeDigits[i] == answerDigits[j]) {
          result[j] = DigitMatch.miss;
          break;
        }
      }
    }

    return answerDigits.indexed.map((e) => Digit(e.$2, result[e.$1])).toList();
  }
}
