import 'package:flutter/foundation.dart';
import 'package:flutter_demo/digit.dart';
import 'package:flutter_demo/digit_match.dart';

import 'game.dart';
import 'game_number.dart';

class GameState with ChangeNotifier {
  late Game game;
  final List<List<Digit>> history = [];
  bool isEnded = false;

  final GameNumber Function() generateChallenge;

  GameState(this.generateChallenge) {
    game = Game(generateChallenge());
  }

  void submit(String value) {
    final answer = GameNumber(value);
    final result = game.guess(answer);
    history.add(result);
    if (result.every((digit) => digit.match == DigitMatch.hit)) {
      isEnded = true;
    }
    notifyListeners();
  }

  void reset() {
    game = Game(generateChallenge());
    history.clear();
    isEnded = false;
    notifyListeners();
  }

  int get turn => history.length;
}
