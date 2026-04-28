import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Empresa',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Company info',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
              ),
              backgroundColor: Color(0x7CFFFFFF),
            ),
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(maxWidth: 250),
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(maxWidth: 250),
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFF6B00),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(maxWidth: 250),
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFF6B00),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(maxWidth: 250),
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(maxWidth: 250),
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFFF6B00),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                style: TextStyle(color: Colors.white),
              ),
            ),
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
                  hintStyle: TextStyle(color: Color(0xFF1F1F1F)),
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
