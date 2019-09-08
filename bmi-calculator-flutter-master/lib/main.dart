import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=>InputPage(),
        '/result':(context)=>Result()
      },
      theme: ThemeData.dark().copyWith(
         primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),

    );
  }
}

