import 'package:flutter/material.dart';

import '../components/auth_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  static String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Icon(
                Icons.flash_on,
                color: Colors.yellow.shade600,
                size: 120.0,
              ),
            ),
            Form(
              child: Column(
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AuthForm(
                type: 'signup',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
