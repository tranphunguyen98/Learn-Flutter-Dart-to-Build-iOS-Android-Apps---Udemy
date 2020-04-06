import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String urlImage =
      'https://zicxa.com/hinh-anh/wp-content/uploads/2019/09/Tuy%E1%BB%83n-t%E1%BA%ADp-h%C3%ACnh-%E1%BA%A3nh-hot-girl-h%E1%BB%8Dc-sinh-Cute-d%E1%BB%85-th%C6%B0%C6%A1ng-3-1-750x938.jpg';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(urlImage),
            ),
            Text(
              'Tran Phu Nguyen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
