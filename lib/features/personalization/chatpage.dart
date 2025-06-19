import 'package:flutter/material.dart';
import 'chatlog.dart';

class Chatpage extends StatefulWidget {
  final int index;
  const Chatpage({super.key, required this.index});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  List<String> massage = [];
  TextEditingController massagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person[widget.index]),
        actions: [
          CircleAvatar(
            backgroundColor: avatarColor(person[widget.index]),
            child: Text(person[widget.index][0]),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: massage.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${massage[index]}",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: massagecontroller)),
                IconButton(
                  onPressed: () {
                    if (massagecontroller.text.isNotEmpty) {
                      setState(() {
                        massage.add(massagecontroller.text);
                        massagecontroller.clear();
                      });
                    }
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
