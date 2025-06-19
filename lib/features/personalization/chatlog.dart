import 'package:flutter/material.dart';

class Chatlog extends StatefulWidget {
  const Chatlog({super.key});

  @override
  State<Chatlog> createState() => _ChatlogState();
}

class _ChatlogState extends State<Chatlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WeChat",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        
      ),
    );
  }
}
