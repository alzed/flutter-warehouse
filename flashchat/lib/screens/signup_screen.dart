import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/components/email_form_field.dart';
import 'package:flashchat/components/password_form_field.dart';
import 'package:flashchat/components/auth_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  static String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

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
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EmailFormField(
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    PasswordFormField(
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    AuthButton(
                      content: 'Sign up',
                      color: Colors.indigo,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            final user =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (user != null) {
                              Navigator.pushNamed(context, ChatScreen.id);
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
