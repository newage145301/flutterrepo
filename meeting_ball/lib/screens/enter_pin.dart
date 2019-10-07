import 'package:flutter/material.dart';
import 'package:meeting_ball/screens/enter_nick.dart';
import 'package:meeting_ball/widgets/game_button.dart';

class EnterPin extends StatelessWidget {
  String newPin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  newPin = value;
                },
                style: TextStyle(color: Color(0xFF0D47A1), fontSize: 30
                ),
                decoration: InputDecoration(
                    hintText: 'Please enter pin',
                  hintStyle: TextStyle(fontSize: 15)
                ),
                textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLength: 4,

              ),
              GameButton(
                  buttonText: 'Next',
                  onPress: () {
                    Navigator.pushNamed(context, 'enternick');
                  }),
            ],
          ),
        ));
  }
}
