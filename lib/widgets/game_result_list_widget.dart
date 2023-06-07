import 'package:flutter/material.dart';

import '../digit.dart';
import 'game_number_result_widget.dart';

class GameResultListWidget extends StatelessWidget {
  final List<List<Digit>> results;

  const GameResultListWidget(this.results, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, i) => GameNumberResultWidget(results[i]),
      ),
    );
  }
}
