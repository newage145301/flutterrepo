import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeting_ball3/widgets/game_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EnterPin extends StatelessWidget {
  String newPin;

  @override
  Widget build(BuildContext context) {
    var _fireStore = Firestore.instance;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  newPin = value;
                },
                style: TextStyle(color: Color(0xFF0D47A1), fontSize: 30),
                decoration: InputDecoration(
                    hintText: 'Please enter pin',
                    hintStyle: TextStyle(fontSize: 15)),
                textAlign: TextAlign.center,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLength: 4,
              ),
              GameButton(
                  buttonText: 'Next',
                  onPress: () async {
                    //todo pin kodu doğrulama yap

                    var data = await _fireStore
                        .collection(newPin.toString())
                        .document('1')
                        .get();

                    if (data.exists ) {
                      if(1<=2)
                        {
                          Alert(
                              type: AlertType.error,
                              context: context,
                              title: "Meeting Ball",
                              desc: "The room you are trying to enter is expired",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Back",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  width: 120,
                                )
                              ])
                              .show();

                        }
                      var userName = data['userName'];
                      print('oda açıldı. Admin: $userName');
                      Navigator.pushNamed(context, 'enternick');
                    } else {
                      Alert(
                        type: AlertType.error,
                          context: context,
                          title: "Meeting Ball",
                          desc: "Invalid Pin Code.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Back",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120,
                            )
                          ])
                          .show();
                    }
                  }),
            ],
          ),
        ));
  }
}
