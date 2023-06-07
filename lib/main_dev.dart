import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/game_state.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'app_state.dart';
import 'game_number.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => GameState(_generateChallenge))
      ],
      child: const MyApp(),
    ),
  );
}

GameNumber _generateChallenge() {
  return GameNumber("1234");
}
