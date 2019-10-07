//todo geri navigasyonla nickname 'e geri gelinememeli


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meeting_ball3/models/game_data.dart';
import 'package:meeting_ball3/widgets/game_button.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EnterNickName extends StatelessWidget {
  final bool isAdmin;

  EnterNickName({this.isAdmin = false});

  String newNickName;
  var _fireStore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    String pin = Provider.of<GameData>(context).pinCode.toString();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Text(
                  isAdmin ? 'Your pin is $pin' : '',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w200),
                ),
              ),
              TextField(
                onChanged: (value) {
                  newNickName = value;
                },
                style: TextStyle(color: Color(0xFF0D47A1), fontSize: 30),
                decoration: InputDecoration(
                    hintText: 'Please enter a nickname',
                    hintStyle: TextStyle(fontSize: 15)),
                textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.text,
                maxLength: 12,
              ),
              GameButton(
                  buttonText: 'Enter Meeting',
                  onPress: () async{
                    if (newNickName != null && !newNickName.isEmpty) {
                      if (isAdmin) {
                        await _fireStore
                            .collection(pin.toString())
                            .document('1')
                            .updateData({'userName': newNickName});
                       Navigator.pushNamed(context, 'meetingroom');
                      } else {

                        await _fireStore
                            .collection(pin.toString())
                            .add({'userName': newNickName, 'isAdmin': false});

                        Navigator.pushNamed(context, 'meetingroom');

                      }
                    } else {
                      Alert(
                          type: AlertType.error,
                          context: context,
                          title: "Meeting Ball",
                          desc: "You cannot pass the nickName field blank",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Back",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ]).show();
                    }
                  }),
            ],
          ),
        ));
  }
}
