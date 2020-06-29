import 'package:flutter/material.dart';
import 'package:homework_with_todos/game/models/move_model.dart';
import 'package:homework_with_todos/game/models/selection_controller.dart';
import 'package:homework_with_todos/game/models/start_controller.dart';

import 'move_animation.dart';

typedef void VoidCallback();

class ComputerSelection extends StatefulWidget {
  final VoidCallback onSelected;
  final SelectionController controller;
  final StartController animationController;

  ComputerSelection({this.onSelected, Key key, this.controller, this.animationController}) : super(key: key);

  @override
  _ComputerSelectionState createState() => _ComputerSelectionState(onSelected, controller, animationController);
}

class _ComputerSelectionState extends State<ComputerSelection> {
  final VoidCallback onSelected;
  final SelectionController controller;
  final StartController animationController;

  Future<MoveModel> animation;

  _ComputerSelectionState(this.onSelected, this.controller, this.animationController) {
    this.animationController.addListener(() => startAnimation());
  }

  void startAnimation(){
    setState(() => {
        animation = Future.delayed(
          Duration(seconds: 2),
          () => MoveModel.random()
        )
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return animation == null ?
      Image(image: AssetImage('assests/all.png'), height: 120, width: 120,) :
      FutureBuilder(
        key: UniqueKey(),
        future: animation,
        builder: (BuildContext context, AsyncSnapshot<MoveModel> snapshot)  {
          if (snapshot.hasData) {
            controller.value = snapshot.data;
            onSelected();
            return controller.value.getImage();
          }
          else {
            return MoveAnimation();
          }
        }
      );
  }
}