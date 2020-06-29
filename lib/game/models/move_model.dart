import 'dart:math';

import 'package:flutter/material.dart';


enum Move {
  Rock,
  Paper,
  Scissors
}


class MoveModel {
  Move move;

  MoveModel({this.move});

  //TODO: You can see how named constructors work here
  MoveModel.random(){
    var result = Random().nextInt(3);
    if (result == 0) move = Move.Rock;
    else if (result == 1) move = Move.Paper;
    else move = Move.Scissors;
  }

  static bool canWin(MoveModel left, MoveModel right){
    return (left.move == Move.Paper && right.move == Move.Rock) ||
      (left.move == Move.Rock && right.move == Move.Scissors) ||
      (left.move == Move.Scissors && right.move == Move.Paper);
  }

  static bool draw(MoveModel left, MoveModel right){
    return (left.move == Move.Paper && right.move == Move.Paper) ||
      (left.move == Move.Rock && right.move == Move.Rock) ||
      (left.move == Move.Scissors && right.move == Move.Scissors);
  }

  Image getImage() {
    // TODO: change image paths
    if (move == Move.Paper) return Image(image: AssetImage('assests/paper--left.png'), height: 120, width: 120,);
    else if (move == Move.Rock) return Image(image: AssetImage('assests/rock--left.png'), height: 120, width: 120,);
    else return Image(image: AssetImage('assests/scissors--left.png'), height: 120, width: 120,);
  }

  MoveModel getNextMove() {

    var moveModel;
    if (move == Move.Paper) moveModel = MoveModel(move: Move.Rock);
    else if (move == Move.Rock) moveModel = MoveModel(move: Move.Scissors);
    else return moveModel = MoveModel(move: Move.Paper);

    return moveModel;
  }

  MoveModel getPreviousMove() {
    var moveModel;
    if (move == Move.Paper) moveModel = MoveModel(move: Move.Scissors);
    else if (move == Move.Rock) moveModel = MoveModel(move: Move.Paper);
    else return moveModel = MoveModel(move: Move.Rock);

    return moveModel;
  }
}