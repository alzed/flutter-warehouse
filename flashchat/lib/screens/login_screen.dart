import 'package:flutter/material.dart';

import '../components/auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              content: 'Log In',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
