import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

enum Gender {
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.FEMALE;
  int height = 180;

  void changeSex(Gender gender) {
    if (selectedGender != gender) {
      setState(() {
        selectedGender = gender;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        changeSex(Gender.FEMALE);
                      },
                      color: kActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        lable: 'FEMALE',
                        isActive: selectedGender == Gender.FEMALE,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        changeSex(Gender.MALE);
                      },
                      color: kActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        lable: 'MALE',
                        isActive: selectedGender == Gender.MALE,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      Slider(
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Theme.of(context).accentColor,
                        inactiveColor: kInactiveColor,
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 80.0,
              color: Theme.of(context).accentColor,
              margin: EdgeInsets.only(
                top: 12.0,
              ),
            )
          ],
        ));
  }
}
