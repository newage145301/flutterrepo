import 'package:flutter/material.dart';
import 'question.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int askedQuestionNumber = 0;

  List<Question> questions = [
    Question('Türkiyenin başkenti Ankara\'dır', true),
    Question('Kan rengi yeşildir', false),
    Question('En büyük ilimiz İstanbul\'dur', false),
    Question('Pi sayısı 3.14\'tür', true),
    Question('İnek süt içer', false)
  ];
  void initialNewQuizz(){
    setState(() {
      askedQuestionNumber = 0;
      myIcons.clear();
    });
  }
  Question pickQuestion() {
    int listLength = questions.length;
    var rnd = Random().nextInt(listLength);
    setState(() {
      askedQuestionNumber++;
    });
    return questions[rnd];
  }

  void controlAnswer(Question question, bool answer) {
    setState(() {
      if (question.answer == answer) {
        myIcons.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        myIcons.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (askedQuestionNumber >= 5) {
        Alert(
          context: context,
          title: "Quizzler",
          desc: "Yarışma bitti",
          buttons: [
            DialogButton(
              child: Text(
                "Yeniden",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                initialNewQuizz();
                Navigator.pop(context);
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "Çıkış",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                exit(0);
              },
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )
          ],
        ).show();
      }
    });
  }

  List<Icon> myIcons = [];

  @override
  Widget build(BuildContext context) {
    Question pickedQuestion;
    setState(() {
      pickedQuestion = pickQuestion();
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                pickedQuestion.question ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Doğru',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                controlAnswer(pickedQuestion, true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Yanlış',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                controlAnswer(pickedQuestion, false);
              },
            ),
          ),
        ),
        Row(
          children: myIcons,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
