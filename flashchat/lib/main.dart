import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/welcome_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatefulWidget {
  const FlashChat({Key key}) : super(key: key);

  @override
  _FlashChatState createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
