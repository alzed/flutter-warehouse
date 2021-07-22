import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/components/message_bubble.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      loggedInUser = currentUser;
    }
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'logo',
          child: Icon(
            Icons.flash_on,
            color: Colors.yellow.shade600,
          ),
        ),
        title: Text(loggedInUser.email),
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
        children: [
          MessageStream(),
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.zero,
              ),
              hintText: 'Type your message ...',
              prefixIcon: Icon(Icons.emoji_emotions_outlined),
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  _firestore.collection('messages').add({
                    'text': _controller.text,
                    'sender': loggedInUser.email,
                    'time': DateTime.now()
                  });
                  setState(() {
                    _controller.clear();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshots) {
        if (!snapshots.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white30,
            ),
          );
        }
        final messages = snapshots.data.docs.reversed;
        List<Widget> messageTexts = [];
        messages.forEach((element) {
          messageTexts.add(MessageBubble(
            text: element['text'],
            sender: element['sender'],
            time: element['time'],
            isMe: element['sender'] == loggedInUser.email,
          ));
        });
        return Expanded(
          child: ListView(
            reverse: true,
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            children: messageTexts,
          ),
        );
      },
    );
  }
}
