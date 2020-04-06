import 'package:flutter/material.dart';
import 'package:flutter_assignment/TextControl.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final texts = ["Blue", "Red", "White", "Purple", "Yellow"];
  var indexText = 0;

  void changeText() {
    setState(() {
      if (indexText < texts.length - 1) {
        indexText += 1;
      } else {
        indexText = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Assignment 1"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(texts[indexText],style: TextStyle(fontSize: 28),),
              TextControl(this.changeText)
            ],
          ),
        ),
      ),
    );
  }
}
