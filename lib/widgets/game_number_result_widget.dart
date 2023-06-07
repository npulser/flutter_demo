import 'package:flutter/material.dart';

import '../digit.dart';
import 'game_digit_widget.dart';

class GameNumberResultWidget extends StatelessWidget {
  final List<Digit> digits;

  const GameNumberResultWidget(this.digits, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: digits
            .map((digit) => GameDigitWidget(
                  digit.value,
                  match: digit.match,
                ))
            .toList(),
      ),
    );
  }
}
