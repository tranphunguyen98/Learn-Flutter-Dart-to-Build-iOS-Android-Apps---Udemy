import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var indexQuestion = 0;
  var questions = [
    "What\'s your favorite color?",
    "What\'s your favorite animal?",
    "What\'s your favorite flower?"
  ];

  void answerQuestion() {
    setState(() {
      if(indexQuestion < 2) {
        indexQuestion = indexQuestion + 1;
        print(indexQuestion);
      } else {
        indexQuestion = 0;
        print(indexQuestion);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("QUIZ"),
        ),
        body: Column(
          children: [
            Text(questions[indexQuestion]),
            RaisedButton(
              child: Text("Answer 1."),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text("Answer 2."),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text("Answer 3."),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
