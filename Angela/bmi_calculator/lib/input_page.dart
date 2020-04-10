import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const activeCardColor = Color(0xFF1D1E33);

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

  void changeSex(Gender gender) {
    if (selectedGender == gender) {
      return;
    }

    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        changeSex(Gender.FEMALE);
                      },
                      child: ReusableCard(
                        color: activeCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          lable: 'FEMALE',
                          isActive: selectedGender == Gender.FEMALE,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        changeSex(Gender.MALE);
                      },
                      child: ReusableCard(
                        color: activeCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          lable: 'MALE',
                          isActive: selectedGender == Gender.MALE,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: activeCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: activeCardColor,
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
