import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flashchat/screens/login_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User currentUser;

  @override
  void initState() {
    super.initState();
    final user = _auth.currentUser;
    if (user != null) {
      currentUser = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.flash_on,
          color: Colors.yellow.shade600,
        ),
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Confirm logout?'),
                    actions: [
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Yes'),
                        onPressed: () {
                          _auth.signOut();
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: 'Type your message ...',
              prefixIcon: Icon(Icons.emoji_emotions_outlined),
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
