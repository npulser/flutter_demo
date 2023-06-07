import 'package:flutter/material.dart';
import 'game_digit_widget.dart';

class GameNumberSelectorWidget extends StatelessWidget {
  final String value;
  final void Function() next;
  final void Function() prev;

  const GameNumberSelectorWidget(this.value, {
    Key? key,
    required this.next,
    required this.prev,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Color.lerp(theme.colorScheme.primary, theme.colorScheme.surface, 0.90),
      ),
      child: Column(
        children: [
          IconButton(onPressed: next, icon: Icon(Icons.keyboard_arrow_up, size: 48,)),
          GameDigitWidget(value),
          IconButton(onPressed: prev, icon: Icon(Icons.keyboard_arrow_down, size: 48)),
        ],
      ),
    );
  }
}
