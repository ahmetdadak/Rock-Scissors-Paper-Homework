import 'package:flutter/material.dart';
import 'package:homework_with_todos/game/widgets/game.dart';
class GamePage extends StatelessWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Rock Scissors Paper"),
        ),
        body: Game(), //Add Game
      ),
    );
  }
}