//todo kullanılmayan importları sil

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meeting_ball3/models/game_data.dart';
import 'package:meeting_ball3/widgets/game_button.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MeetingRoom extends StatelessWidget {
  var _fireStore = Firestore.instance;

  void getSubscriber()
  {
    _fireStore.collection(Provider.of<GameData>(context))
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit a Meeting Room'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () => Navigator.pushNamed(context, 'initialgame'),
                  child: new Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

/*    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: Container(
            padding: EdgeInsets.all(10),
          )),
    );
*/

    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          print('başla');
        },
        child: Icon(Icons.add),
      ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
            ),
            ListView.builder(itemBuilder: null)
          ],
        ));
  }
}
