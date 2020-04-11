import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        accentColor: Color(0xFFEB1555),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        primaryColorLight: Color(0xFF1D1E33),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => InputPage(),
        ResultsPage.routeName: (_) => ResultsPage()
      },
    );
  }
}
