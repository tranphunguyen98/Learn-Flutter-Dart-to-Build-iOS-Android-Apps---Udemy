import 'package:flutter/material.dart';
import 'package:meals_app/widgets/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CategoriesScreen(),
    );
  }
}
