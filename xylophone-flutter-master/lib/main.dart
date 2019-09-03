import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void soundPlayer(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildKey(number, color) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          soundPlayer(number);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, Colors.cyanAccent),
              buildKey(2, Colors.teal),
              buildKey(3, Colors.deepOrange),
              buildKey(4, Colors.yellow),
              buildKey(5, Colors.deepPurple),
              buildKey(6, Colors.amber),
              buildKey(7, Colors.indigoAccent),
            ],
          ),
        ),
      ),
    );
  }
}
