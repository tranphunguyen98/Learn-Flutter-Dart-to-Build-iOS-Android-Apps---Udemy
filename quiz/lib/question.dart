import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {

  final String _questionText;

  Question(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Text(_questionText);
  }

}
