import 'package:flutter/material.dart';

import '../components/auth_button.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key key}) : super(key: key);

  static String id = 'signin_screen';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
                children: [
                  TextField(),
                  TextField(),
                ],
              ),
            ),
            AuthButton(
              content: 'Sign In',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
