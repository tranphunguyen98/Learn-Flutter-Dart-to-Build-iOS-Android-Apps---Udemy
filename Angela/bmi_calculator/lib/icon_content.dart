import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String lable;

  final bool isActive;

  IconContent({
    @required this.lable,
    @required this.icon,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: isActive ? kActiveColor : kInactiveColor,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          lable,
          style: TextStyle(
            fontSize: 18.0,
            color: isActive ? kActiveColor : kInactiveColor,
          ),
        ),
      ],
    );
  }
}
