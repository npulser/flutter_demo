import 'package:flutter/material.dart';

import '../game_number.dart';
import 'game_digit_selector_widget.dart';

class GameNumberInputWidget extends StatefulWidget {
  final void Function(String) onSubmit;

  const GameNumberInputWidget({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<GameNumberInputWidget> createState() => _GameNumberInputWidgetState();
}

class _GameNumberInputWidgetState extends State<GameNumberInputWidget> {
  late List<String> allowedValue;
  late List<String> digits;

  @override
  void initState() {
    super.initState();
    digits = GameNumber.zero().digits;
    allowedValue = GameNumber.allowedCharacters;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: digits.indexed
                .map((digit) => GameNumberSelectorWidget(
                      digit.$2,
                      next: () {
                        final index = digit.$1;
                        _next(index);
                      },
                      prev: () {
                        final index = digit.$1;
                        _prev(index);
                      },
                    ))
                .toList(),
          ),
          FilledButton(
            onPressed: () {
              widget.onSubmit(digits.join(''));
            },
            child: Text(
              'OK',
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.colorScheme.surface),
            ),
          ),
        ],
      ),
    );
  }

  void _next(int index) {
    final current = digits[index];
    final currentIndex = allowedValue.indexOf(current);
    final nextIndex = (currentIndex + 1) % allowedValue.length;
    setState(() {
      digits[index] = allowedValue[nextIndex];
    });
  }

  void _prev(int index) {
    final current = digits[index];
    final currentIndex = allowedValue.indexOf(current);
    final prevIndex = (currentIndex - 1) % allowedValue.length;
    setState(() {
      digits[index] = allowedValue[prevIndex];
    });
  }
}
