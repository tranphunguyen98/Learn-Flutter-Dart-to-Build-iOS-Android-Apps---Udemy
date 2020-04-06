import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String _answerText;
  final Function _handlerSelected;

  Answer(this._answerText,this._handlerSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16,right: 16),
      child: RaisedButton(
        child: Text(this._answerText,style: TextStyle(color: Colors.white),),
        onPressed: this._handlerSelected,
        color: Colors.blue,
      ),
    );
  }
}
