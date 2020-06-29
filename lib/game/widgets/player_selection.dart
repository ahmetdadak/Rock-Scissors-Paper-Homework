import 'package:flutter/material.dart';
import 'package:homework_with_todos/game/models/move_model.dart';
import 'package:homework_with_todos/game/models/selection_controller.dart';

class PlayerSelection extends StatefulWidget {
  final SelectionController controller;
  PlayerSelection({@required this.controller, Key key}) : super(key: key);

  @override
  _PlayerSelectionState createState() => _PlayerSelectionState(controller);
}

class _PlayerSelectionState extends State<PlayerSelection> {

  final SelectionController controller;
  _PlayerSelectionState(this.controller);

  void setMove(MoveModel nextMove) {
    controller.value = nextMove;
    setState(() {
      controller.value = nextMove;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // TODO: Implement Icon button which will call setMove(controller.value.getNextMove())
        IconButton(icon: Icon(Icons.arrow_upward), onPressed: () => setMove(controller.value.getNextMove()),),
        // TODO: Call controller.value.getImage() which will get the image of the move
        controller.value.getImage(),
        // TODO: Implement Icon button which will call setMove(controller.value.getPreviousMove())
        IconButton(icon: Icon(Icons.arrow_downward), onPressed: () => setMove(controller.value.getPreviousMove()),),
      ],
    );
  }
}