//todo pin code lırken loading dönse iyi olur. pincode da null gözüküyor

import 'package:flutter/material.dart';
import 'package:meeting_ball3/models/game_data.dart';
import 'package:meeting_ball3/screens/enter_nick.dart';
import 'package:meeting_ball3/widgets/game_button.dart';
import 'package:provider/provider.dart';

class NewGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //
    String newPin=Provider.of<GameData>(context).pinCode.toString();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Your pin is : $newPin',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D47A1)
                ),

              ),
              GameButton(
                  buttonText: 'Next',
                  onPress: () {
                    Navigator.pushNamed(context, 'enternickadmin');
                  }),
            ],
          ),
        ));
  }
}
