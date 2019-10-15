//todo kullanılmayan importları sil
//todo provider a atılan değişkenler gerçekten son değeri tutmuyor olabilirler


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meeting_ball3/models/game_data.dart';
import 'package:meeting_ball3/widgets/game_button.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MeetingRoom extends StatelessWidget {
  var _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {

  /*  void getSubscriber() async
    {
      final subscriber = await _fireStore.collection(Provider.of<GameData>(context).pinCode.toString()).getDocuments();
      for(var a in subscriber.documents)
      {
      print(a.data);
      }
    }*/

  void subscriberStream() async
  {
   await for(var snapshot in  _fireStore.collection(Provider.of<GameData>(context).pinCode.toString()).snapshots())
     {
       for(var a in snapshot.documents)
       {
         print(a.data);
       }
     }

  }

   /* Future<bool> _onWillPop() {
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
    } */

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
         print(Provider.of<GameData>(context).pinCode);
        },
        child: Icon(Icons.add),
      ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          children: <Widget>[
            Container(
              child: Text('sdasd'),
            ),
         StreamBuilder<QuerySnapshot>(
           stream:_fireStore.collection(Provider.of<GameData>(context).pinCode.toString()).snapshots(),
           builder: (context,snapshot){
             if(snapshot.hasData)
               {
                 List<Text> textList=[];
                 final subscriber= snapshot.data.documents;
                 for(var subs in subscriber )
                   {
                     final subscribe = subs.data['userName'].toString();
                      final messageWidget = Text(subscribe);
                      textList.add(messageWidget);
                   }
                 return Column(
                   children: textList,
                 );
               } else return Column(children: <Widget>[
                 Text('Not user yet')]);

           },
         )

          ],
        ));
  }
}
