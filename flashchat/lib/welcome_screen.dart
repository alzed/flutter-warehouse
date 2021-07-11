import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'login_screen.dart';
import 'signin_screen.dart';
import 'auth_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 100.0,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Icon(
                    Icons.flash_on,
                    color: Colors.yellow.shade600,
                    size: controller.value,
                  ),
                ),
                AnimatedTextKit(
                  pause: Duration(seconds: 2),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flashchat',
                      textStyle: TextStyle(
                        fontSize: 50.0,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0),
            AuthButton(
              content: 'Log In',
              onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.id);
              },
            ),
            AuthButton(
              color: Colors.indigo,
              content: 'Sign In',
              onPressed: () {
                Navigator.of(context).pushNamed(SigninScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
