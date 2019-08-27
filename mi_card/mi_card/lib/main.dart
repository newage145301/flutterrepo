import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/vesikalik.png'),
            ),
            Text(
              'Ali Can',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico'),
            ),
            Text(
              'Developer',
              style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 2.5),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                  children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.teal.shade100,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '123 456 789',
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.teal.shade100,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'alican@gmail.com',
                    style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
