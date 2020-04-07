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
                fontFamily: 'Pacifico',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                color: Colors.teal.shade100,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    '+84 35 6030 876',
                    style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'tranphunguyen.fit@gmail.com',
                    style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
