import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(
      MaterialApp(
        home: MyBallApp(),
      ),
    );

class MyBallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Question(),
    );
  }
}

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int numberpic=1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(
          onPressed:(){
            setState(() {
              numberpic=Random().nextInt(5)+1;
            });
            print('dfsd');
          } ,
          child: Image(image: AssetImage('images/ball$numberpic.png')),
        ),
      ),
    );
  }
}
