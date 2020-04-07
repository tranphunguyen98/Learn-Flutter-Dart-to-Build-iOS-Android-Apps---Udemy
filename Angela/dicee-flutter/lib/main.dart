import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var dice1 = 0;
  var dice2 = 0;

  String get urlImageRandom {
    final diceNumber = Random().nextInt(5) + 1;
    switch (diceNumber) {
      case 1:
        return 'images/dice1.png';
      case 2:
        return 'images/dice2.png';
      case 3:
        return 'images/dice3.png';
      case 4:
        return 'images/dice4.png';
      case 5:
        return 'images/dice5.png';
      case 6:
        return 'images/dice6.png';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
              width: 150,
              child: Image.asset(
                urlImageRandom,
                fit: BoxFit.cover,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
              width: 150,
              child: Image.asset(
                urlImageRandom,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
