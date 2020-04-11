import 'package:flutter/material.dart';

class BottomPanel extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  BottomPanel({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          this.label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        width: double.infinity,
        height: 80.0,
        color: Theme.of(context).accentColor,
        margin: EdgeInsets.only(
          top: 12.0,
        ),
      ),
    );
  }
}
