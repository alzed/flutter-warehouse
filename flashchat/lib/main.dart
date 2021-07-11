import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/login_screen.dart';
import 'screens/chat_screen.dart';

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
