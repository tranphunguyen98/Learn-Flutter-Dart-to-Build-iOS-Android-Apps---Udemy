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
  final _questions = const [
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
      _indexQuestion = _indexQuestion + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("QUIZ"),
        ),
        body: _indexQuestion < _questions.length ? Column(
          children: [
            Question(_questions[_indexQuestion]["questionText"]),
            ...(_questions[_indexQuestion]["answers"] as List<String>)
                .map((answer) {
              return Answer(answer, answerQuestion);
            }),
          ],
        ) : Center(child: Text("You did it!"),),
      ),
    );
  }
}
