import 'package:flutter/material.dart';

import '../digit_match.dart';

class GameDigitWidget extends StatelessWidget {
  final String value;
  final DigitMatch? match;

  const GameDigitWidget(this.value, {
    Key? key,
    this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
        color: _from(match),
      ),
      padding: EdgeInsets.all(10.0),
      child: Text(
        value,
        style: theme.textTheme.displayMedium,
      ),
    );
  }

  Color _from(DigitMatch? match) {
    return switch (match) {
      null => Colors.transparent,
      DigitMatch.hit => Colors.green,
      DigitMatch.miss => Colors.orange,
      DigitMatch.wrong => Colors.transparent,
    };
  }
}
