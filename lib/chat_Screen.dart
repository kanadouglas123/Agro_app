import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 499,),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Flexible(
                 child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black38,
                  child: Expanded(child: TextField(
                    
                  ))),
               ),
             ),
            
          ],
        ),
      ),
    );
  }
}