import 'package:flutter/material.dart';

import 'sign_in_screen.dart';
import 'welcome_screen.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SignInScreen(),
    );
  }
}
