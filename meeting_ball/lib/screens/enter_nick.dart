import 'package:flutter/material.dart';
import 'package:meeting_ball/models/game_data.dart';
import 'package:meeting_ball/widgets/game_button.dart';
import 'package:provider/provider.dart';

class EnterNickName extends StatelessWidget {
  final bool isAdmin;

  EnterNickName({this.isAdmin=false});

  String newNickName;

  @override
  Widget build(BuildContext context) {
    String pin = Provider.of<GameData>(context).pinCode.toString();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Text(isAdmin?'Your pin is $pin':'',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.w200
                ),),
              ),
              TextField(
                onChanged: (value) {
                  newNickName = value;
                },
                style: TextStyle(color: Color(0xFF0D47A1), fontSize: 30
                ),
                decoration: InputDecoration(
                    hintText: 'Please enter a nickname',
                  hintStyle: TextStyle(fontSize: 15)
                ),
                textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.text,
                maxLength: 12,

              ),
              GameButton(
                  buttonText: 'Enter Meeting',
                  onPress: () {
                    print('');
                  }),
            ],
          ),
        ));
  }
}
