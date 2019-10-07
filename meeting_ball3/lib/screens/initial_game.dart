import 'package:flutter/material.dart';
import 'package:meeting_ball3/models/game_data.dart';
import 'package:meeting_ball3/widgets/game_button.dart';
import 'package:provider/provider.dart';

class InitialGame extends StatelessWidget {
  void newGameOnPress() {
    print('New game');
  }

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
              GameButton(buttonText: 'New Game', onPress: (){
                Provider.of<GameData>(context).generateNewPinCode();
                Navigator.pushNamed(context, 'newgame');
              }),
              GameButton(
                  buttonText: 'Enter Pin',
                  onPress: () {
                    Navigator.pushNamed(context, 'enterpin');
                  }),
            ],
          ),
        ));
  }
}
