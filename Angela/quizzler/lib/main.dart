import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzler'),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Icon> scoreKeeper = [];
  final quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestion(),
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            child: Text(
              'True',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.green,
            onPressed: () {
              checkAnswer(true);
            },
          ),
        ),
        SizedBox(
          height: 24.0,
        ),
        Expanded(
          child: FlatButton(
            child: Text(
              'False',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.red,
            onPressed: () {
              checkAnswer(false);
            },
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          children: scoreKeeper,
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  void checkAnswer(userAnswer) {
    final correctAnswer = quizBrain.getAnswer();

    if (quizBrain.isEndOfList()) {
      return;
    }

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      quizBrain.nextQuestion();
    });
  }
}
