import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _store = Firestore.instance;

  FirebaseUser userLoggedIn;

  String message;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      userLoggedIn = await _auth.currentUser();
      if (userLoggedIn != null) {
        print(userLoggedIn.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getStreamMessages() async {
    await for (var snapshots in _store.collection('messages').snapshots()) {
      for (var snapshot in snapshots.documents) {
        print(snapshot.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                getStreamMessages();
                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _store.collection('messages').snapshots(),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    List<Text> listText = [];
                    for (var snapshot in asyncSnapshot.data.documents) {
                      final messageText = snapshot.data['text'];
                      final messageSender = snapshot.data['sender'];
                      listText.add(Text('$messageText from $messageSender'));
                    }
                    return Column(
                      children: listText,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _store
                          .collection('messages')
                          .add({'text': message, 'sender': userLoggedIn.email});
                    },
                    child: Text(
                      'Send',
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
