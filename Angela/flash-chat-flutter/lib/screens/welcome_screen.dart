import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = 'wel';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Color> animation;
  // int count = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    // animation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.easeIn,
    // );

    animation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);

    // controller.forward();

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   } else if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   }
    // });

    controller.addListener(() {
      // count++;
      // setState(() {});
      //print('${controller.value} $count ${animation.value}');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(
                    milliseconds: 100,
                  ),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              label: 'Log In',
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              label: 'Register',
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
