import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('I AM Poor!'),
            backgroundColor: Colors.amberAccent,
          ),
          body: Center(
            child: Image(
              image: AssetImage('images/istanbul.jpg'),
            ),
          ),
          backgroundColor: Colors.amber,
        ),
      ),
    );
