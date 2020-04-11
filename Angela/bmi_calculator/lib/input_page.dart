import 'package:bmi_calculator/results_page.dart';
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
  int weight = 70;
  int age = 20;

  void changeSex(Gender gender) {
    if (selectedGender != gender) {
      setState(() {
        selectedGender = gender;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('build');

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
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Theme.of(context).accentColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayColor:
                              Theme.of(context).accentColor.withOpacity(0.16),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 24,
                          ),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: kInactiveColor,
                        ),
                        child: Slider(
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                        ),
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: weight <= 0
                                    ? null
                                    : () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: age <= 0
                                    ? null
                                    : () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ResultsPage.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'CACULATE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                width: double.infinity,
                height: 80.0,
                color: Theme.of(context).accentColor,
                margin: EdgeInsets.only(
                  top: 12.0,
                ),
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  RoundIconButton({@required this.onPressed, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onPressed: this.onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(
        this.icon,
        color: Colors.white,
      ),
    );
  }
}
