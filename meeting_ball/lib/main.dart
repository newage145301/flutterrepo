import 'package:flutter/material.dart';
import 'package:meeting_ball/screens/initial_game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialGame(),
    );
  }
}
