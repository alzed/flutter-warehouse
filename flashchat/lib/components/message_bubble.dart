import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.text,
    @required this.sender,
    @required this.time,
    @required this.isMe,
  }) : super(key: key);

  final String text;
  final String sender;
  final Timestamp time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(color: Colors.black54, fontSize: 15.0),
          ),
          Material(
            color: isMe ? Colors.blue : Colors.indigo,
            borderRadius: isMe
                ? BorderRadiusDirectional.only(
                    topStart: Radius.circular(20.0),
                    bottomStart: Radius.circular(20.0),
                    bottomEnd: Radius.circular(20.0),
                  )
                : BorderRadiusDirectional.only(
                    topEnd: Radius.circular(20.0),
                    bottomStart: Radius.circular(20.0),
                    bottomEnd: Radius.circular(20.0),
                  ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Text(
                    time.toDate().toString().substring(11, 16),
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
