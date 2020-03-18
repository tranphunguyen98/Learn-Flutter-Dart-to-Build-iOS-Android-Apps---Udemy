import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  var _indexQuestion = 0;
  final _questions = const [
    {
      "questionText": "What\'s your favorite color?",
      "answers": [
        {"text": "Blue", "score": 10},
        {"text": "Red", "score": 7},
        {"text": "White", "score": 3},
        {"text": "Yellow", "score": 1},
      ]
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": [
        {"text": "Elephant", "score": 8},
        {"text": "Snake", "score": 4},
        {"text": "Turtle", "score": 3},
        {"text": "Tiger", "score": 1},
      ]
    },
    {
      "questionText": "What\'s your favorite flower?",
      "answers": [
        {"text": "Rose", "score": 9},
        {"text": "Violet", "score": 7},
        {"text": "Daise", "score": 2},
      ]
    },
  ];

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      _indexQuestion = 0;
    });
  }

  void answerQuestion(int score) {
    setState(() {
      _indexQuestion = _indexQuestion + 1;
    });
    _totalScore += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("QUIZ"),
          ),
          body: _indexQuestion < _questions.length
              ? Quiz(_questions[_indexQuestion], answerQuestion)
              : Result(_totalScore,this.resetQuiz)),
    );
  }
}
