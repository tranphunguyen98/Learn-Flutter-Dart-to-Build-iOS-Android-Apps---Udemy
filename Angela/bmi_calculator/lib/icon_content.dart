import 'package:flutter/material.dart';

const childCardBackgroundColor = Color(0xFF8D8E98);

const lableTextStyle = TextStyle(
  fontSize: 18.0,
  color: childCardBackgroundColor,
);

class IconContent extends StatelessWidget {
  final IconData icon;
  final String lable;

  IconContent({
    @required this.lable,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          lable,
          style: lableTextStyle,
        ),
      ],
    );
  }
}
