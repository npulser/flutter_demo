import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  ThemeMode mode;

  AppState([this.mode = ThemeMode.light]);

  void toggleTheme() {
    if (mode == ThemeMode.dark) {
      mode = ThemeMode.light;
    } else {
      mode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
