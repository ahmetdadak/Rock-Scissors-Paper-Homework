import 'package:flutter/material.dart';
import 'package:homework_with_todos/game/models/move_model.dart';
import 'package:homework_with_todos/game/models/selection_controller.dart';
import 'package:homework_with_todos/game/models/start_controller.dart';
import 'package:homework_with_todos/game/widgets/computer_selection.dart';
import 'package:homework_with_todos/game/widgets/player_selection.dart';

class Game extends StatelessWidget {
  // TODO: look the definitions of SelectionController and StartController
  // They are just events that trigger some methods of child widget and/or hold value
  final SelectionController playerSelectionController =
      SelectionController(MoveModel(move: Move.Paper));
  final SelectionController computerSelectionController =
      SelectionController(MoveModel(move: Move.Paper));
  final StartController animationStartController = StartController();

  Game({Key key}) : super(key: key);


  void onRoundEnd(BuildContext context) {
    if (MoveModel.canWin(
        playerSelectionController.value, computerSelectionController.value)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(content: Text('You Won', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,), duration: Duration(seconds: 1), backgroundColor: Colors.green,);
        Scaffold.of(context).showSnackBar(snackBar);
      });
    } else if (MoveModel.draw(
        playerSelectionController.value, computerSelectionController.value)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(content: Text('Draw', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,), duration: Duration(seconds: 1), backgroundColor: Colors.yellow,);
        Scaffold.of(context).showSnackBar(snackBar);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(content: Text('You Lost', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),  duration: Duration(seconds: 1), backgroundColor: Colors.red,);
        Scaffold.of(context).showSnackBar(snackBar);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PlayerSelection(controller: playerSelectionController),

        // TODO: Add PlayerSelection
        // Hint: it is biig make it small
        // Tip: You should set controller as playerSelectController

        // TODO: Add Button
        // Hint: set onPressed to animationStartController.start(). this will start the random animation on computer selection

        FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          splashColor: Colors.blueAccent,
          onPressed: () => animationStartController.start(),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        // TODO: Add Computer Selection
        ComputerSelection(controller: computerSelectionController, animationController: animationStartController, onSelected: () => onRoundEnd(context),)
        // Tip: You should set controller as computerSelectController
        // Tip: You should set animationController as animationStartController
        // Tip: You should set onSelected to onRoundEnd since game will end when computer select the move
      ],
    );
  }
}
