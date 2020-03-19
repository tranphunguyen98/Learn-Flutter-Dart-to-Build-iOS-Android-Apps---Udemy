import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function changeText;

  TextControl(this.changeText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text("Change!",),
        onPressed: this.changeText),
    );
  }
}