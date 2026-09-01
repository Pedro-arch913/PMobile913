import 'package:flutter/material.dart';
import 'package:pmobile913/widget/build_message_chat.dart';

class Chat extends StatefulWidget {
  final String name;
  final String avatar;
  final String info;

  const Chat({
    super.key,
    required this.name,
    required this.avatar,
    required this.info,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b0b0b),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D2D2D),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.info,
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.avatar),
              backgroundColor: Color(0x7CFFFFFF),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          BuildMessage(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
            isMe: false,
          ),
          BuildMessage(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            isMe: true,
          ),
          BuildMessage(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            isMe: true,
          ),
          BuildMessage(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
            isMe: false,
          ),
          BuildMessage(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            isMe: true,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        color: Color(0xFF2D2D2D),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Digite uma mensagem...",
                  hintStyle: TextStyle(color: Color(0xFFAAAAAA)),
                  filled: true,
                  fillColor: Color(0xFF666666),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: Color(0xFFFF6B00),
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
