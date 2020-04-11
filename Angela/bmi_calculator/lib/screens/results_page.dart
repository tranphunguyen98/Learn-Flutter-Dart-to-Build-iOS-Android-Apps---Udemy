import 'package:bmi_calculator/caculater_brain.dart';
import 'package:bmi_calculator/components/bottom_panel.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  static const routeName = '/result-page';
  @override
  Widget build(BuildContext context) {
    final datas = ModalRoute.of(context).settings.arguments
        as Map<String, CalculatorBrain>;
    final calc = datas['calc'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(
                16.0,
              ),
              child: Text(
                'YOUR RESULT',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    calc.getResult(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    calc.calculateBMI(),
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    calc.getInterpretation(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomPanel(
              label: 'RE-CACULATE',
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
