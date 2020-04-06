import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.purple,
                width: 100,
                height: 100,
                child: Text("1"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                    child: Text("2"),
                  ),
                  Container(
                    color: Colors.white,
                    width: 100,
                    height: 100,
                    child: Text("2"),
                  ),
                ],
              ),
              Container(
                color: Colors.green,
                width: 100,
                height: 100,
                child: Text("3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
