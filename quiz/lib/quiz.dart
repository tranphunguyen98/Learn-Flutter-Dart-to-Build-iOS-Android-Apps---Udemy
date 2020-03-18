import 'package:flutter/cupertino.dart';
import 'package:quiz/question.dart';
import 'package:quiz/answer.dart';

class Quiz extends StatelessWidget {
  final Map<String,Object> question;
  final Function answerQuestion;

  Quiz(this.question,this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question["questionText"]),
        ...(question["answers"] as List<String>)
            .map((answer) {
          return Answer(answer, answerQuestion);
        }),
      ],
    );
  }
}
