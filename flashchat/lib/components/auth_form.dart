import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_button.dart';
import 'email_form_field.dart';
import 'password_form_field.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key key,
    @required this.type,
  }) : super(key: key);

  final String type;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            content: widget.type == 'signup' ? 'Sign Up' : 'Log In',
            color: Colors.indigo,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                print('Done');
                if (widget.type == 'signin') {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                  } catch (e) {
                    print(e);
                  }
                } else {}
              }
            },
          ),
        ],
      ),
    );
  }
}
