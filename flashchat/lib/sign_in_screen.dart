import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.flash_on,
                  color: Colors.yellow,
                  size: 40.0,
                ),
                Text(
                  'FlashChat',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.lightBlue,
                  ),
                )
              ],
            ),
            TextField(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
