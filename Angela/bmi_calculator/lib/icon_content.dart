import 'package:flutter/material.dart';

const inactiveColor = Color(0xFF8D8E98);
const activeColor = Colors.white;

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
          color: isActive ? activeColor : inactiveColor,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          lable,
          style: TextStyle(
            fontSize: 18.0,
            color: isActive ? activeColor : inactiveColor,
          ),
        ),
      ],
    );
  }
}
