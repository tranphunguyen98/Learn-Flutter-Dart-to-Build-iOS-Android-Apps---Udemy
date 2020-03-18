import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'answer.dart';

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
    {
      "questionText": "What\'s your favorite color?",
      "answers": ["Blue", "Red", "White", "Yellow"]
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": ["Elephant", "Snake", "Turtle", "Tiger"]
    },
    {
      "questionText": "What\'s your favorite flower?",
      "answers": ["Rose", "Violet", "Daise"]
    },
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
            Question(_questions[_indexQuestion]["questionText"]),
            ...(_questions[_indexQuestion]["answers"] as List<String>)
                .map((answer) {
              return Answer(answer, answerQuestion);
            }),
          ],
        ),
      ),
    );
  }
}
