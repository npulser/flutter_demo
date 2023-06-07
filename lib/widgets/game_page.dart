import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/game_result_list_widget.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../game_state.dart';
import 'game_number_input_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final state = Provider.of<GameState>(context);
    if (state.isEnded) {
      Future.microtask(() {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('You win!!'),
                  actions: [
                    FilledButton(
                        onPressed: () {
                          state.reset();
                          Navigator.of(context).pop();
                        },
                        child: Text('New game'))
                  ],
                ));
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('#${state.turn}'),
        actions: [
          if (kDebugMode)
            Text(state.game.challenge.value),
          IconButton(
            onPressed: appState.toggleTheme,
            icon: Icon(Icons.light_mode_outlined),
          ),
          IconButton(
            onPressed: state.reset,
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          GameResultListWidget(state.history),
          GameNumberInputWidget(onSubmit: state.submit),
        ],
      ),
    );
  }
}
