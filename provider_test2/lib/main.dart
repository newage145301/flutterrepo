import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      builder: (context) => Data(),
      child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text(''),
              ),
              body: Level1())),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level2();
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Level3();
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Text(Provider.of<Data>(context).data)),
        TextField(
          onChanged: (value) {
            Provider.of<Data>(context).changedata(value);
          },
        )
      ],
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'datattata';

  void changedata(value) {
    data = value;
    notifyListeners();
  }
}
