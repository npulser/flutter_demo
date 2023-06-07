import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/app_state.dart';
import 'package:flutter_demo/game_state.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'game_number.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => GameState(_generateChallenge)),
      ],
      child: const MyApp(),
    ),
  );
}

GameNumber _generateChallenge() {
  final rand = Random();
  final max = GameNumber.allowedCharacters.length;
  return GameNumber([
    GameNumber.allowedCharacters[rand.nextInt(max)],
    GameNumber.allowedCharacters[rand.nextInt(max)],
    GameNumber.allowedCharacters[rand.nextInt(max)],
    GameNumber.allowedCharacters[rand.nextInt(max)],
  ].join(''));
}
