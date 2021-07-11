import 'package:flutter/material.dart';

import 'welcome_screen.dart';
import 'signin_screen.dart';
import 'login_screen.dart';
import 'chat_screen.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SigninScreen.id: (context) => SigninScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
