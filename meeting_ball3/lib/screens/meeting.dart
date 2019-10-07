import 'package:flutter/material.dart';
import 'package:meeting_ball3/models/game_data.dart';
import 'package:meeting_ball3/widgets/game_button.dart';
import 'package:provider/provider.dart';

class Meeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String pin = Provider.of<GameData>(context).pinCode.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
