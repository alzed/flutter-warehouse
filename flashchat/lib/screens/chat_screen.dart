import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flashchat/screens/login_screen.dart';

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  User loggedInUser;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MessageStream(),
          ),
          TextField(
            controller: _controller,
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
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshots) {
        if (!snapshots.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white30,
            ),
          );
        }
        final messages = snapshots.data.docs;
        List<Widget> messageTexts = [];
        messages.forEach((element) {
          messageTexts.add(MessageBubble(
            text: element['text'],
            sender: element['sender'],
            time: element['time'],
          ));
        });
        return ListView(
          children: messageTexts,
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.text,
    @required this.sender,
    @required this.time,
  }) : super(key: key);

  final String text;
  final String sender;
  final Timestamp time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          sender,
          style: TextStyle(color: Colors.black54, fontSize: 10.0),
        ),
        Material(
          color: Colors.blue,
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              Text(time.toDate().toString()),
            ],
          ),
        ),
      ],
    );
  }
}
