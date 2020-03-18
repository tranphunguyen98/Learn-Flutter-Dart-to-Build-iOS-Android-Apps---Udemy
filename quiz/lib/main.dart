import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _indexQuestion = 0;
  var _questions = [
    "What\'s your favorite color?",
    "What\'s your favorite animal?",
    "What\'s your favorite flower?"
  ];

  void answerQuestion() {
    setState(() {
      if (_indexQuestion < 2) {
        _indexQuestion = _indexQuestion + 1;
        print(_indexQuestion);
      } else {
        _indexQuestion = 0;
        print(_indexQuestion);
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
            Question(_questions[_indexQuestion]),
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
