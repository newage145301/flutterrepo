import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;

  GameButton({this.buttonText,this.onPress});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPress,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text(buttonText,
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
