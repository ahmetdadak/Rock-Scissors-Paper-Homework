import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework_with_todos/game/models/move_model.dart';

class MoveAnimation extends StatefulWidget {
  MoveAnimation({Key key}) : super(key: key);

  @override
  _MoveAnimationState createState() => _MoveAnimationState();
}

class _MoveAnimationState extends State<MoveAnimation> {
  Timer timer;
  MoveModel move;
  int animationMs;
  _MoveAnimationState(){
    move = MoveModel.random();
    // TODO: Set timer to call setState(() => move = move.getNextMove()); }
    // every x miliseconds
    animationMs= 50;
    timer = Timer.periodic(
        Duration(milliseconds: animationMs),
        (timer) { setState(() => move = move.getNextMove()); }
      );

  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return move.getImage();
  }
}