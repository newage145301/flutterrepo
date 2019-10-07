//todo enternick boş geçilmemeli
//todo landscape ekran olmamalı
//todo odalara girilirken expire olup olmadığına bakılmalı

import 'package:flutter/material.dart';
import 'package:meeting_ball3/screens/enter_nick.dart';
import 'package:meeting_ball3/screens/enter_pin.dart';
import 'package:meeting_ball3/screens/initial_game.dart';
import 'package:meeting_ball3/screens/new_game.dart';
import 'package:provider/provider.dart';
import 'models/game_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      builder: (context)=>GameData(),
      child: MaterialApp(
        home: InitialGame(),
        initialRoute: 'initialgame',
        routes: {
          'initialgame': (context) => InitialGame(),
          'enterpin': (context) => EnterPin(),
          'enternick': (context) => EnterNickName(isAdmin: false),
          'enternickadmin': (context) => EnterNickName(isAdmin: true),
          'newgame': (context) => NewGame(),
        },
      ),
    );
  }
}
