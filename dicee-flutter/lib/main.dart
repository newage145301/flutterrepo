import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int dice1Value = 1;
  int dice2Value = 1;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
               randomNumbers();
              },
              child: Image.asset('images/dice$dice1Value.png'),
            ),
          ),
          Expanded(
            child:FlatButton(
              onPressed: () {
                randomNumbers();
              },
              child: Image.asset('images/dice$dice2Value.png'),
            ),
          ),
        ],

      ),
    );
  }
 void randomNumbers (){
   setState(() {
     dice1Value=Random().nextInt(6)+1;
     dice2Value=Random().nextInt(6)+1;
   });
 }
}
