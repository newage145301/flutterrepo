import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = Firestore.instance;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  FirebaseUser loggedInUser;
  String messageText;
  TextEditingController messageTextController=TextEditingController();

  void getCurrentUser() async {
    try {
      var user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;

        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  /* void getMessages() async{
    final messages = await _fireStore.collection('messages').getDocuments();

    for(var message in messages.documents)
      {
        print(message.data);
      }
  }*/

  void messagesStream() async {
    await for (var stream in _fireStore.collection('messages').snapshots()) {
      for (var message in stream.documents) {
        print(message.data);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                // _auth.signOut();
                // Navigator.pop(context);

                messagesStream();
              }),
        ],
        title: Text('⚡️Mesajlaş app'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                      style: new TextStyle(color: Colors.black),
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      //Implement send functionality.
                      try {
                        await _fireStore.collection('messages').add({
                          'sender': loggedInUser.email,
                          'text': messageText
                        });
                      } catch (e) {
                        print(e);
                      } finally {
                        messageTextController.clear();
                      }
                    },
                    child: Text(
                      'Gönder',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fireStore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        for (var message in messages) {
          final messageText = message.data['text'];
          final sender = message.data['sender'];

          final messageWidget =
              MessageBubble(message: messageText, sender: sender);

          messageWidgets.add(messageWidget);
        }

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.message});

  final String sender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          SizedBox(height: 1),
          Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 5,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message,
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
