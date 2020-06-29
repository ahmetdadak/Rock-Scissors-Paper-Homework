import 'package:flutter/material.dart';
import 'package:homework_with_todos/game/game_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GamePage(), // TODO: Add Game Page
    );
  }
}