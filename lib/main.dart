import 'package:flutter/material.dart';
import 'package:teste01/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          appBar: AppBar(centerTitle: false,
            title: Text('Inbox', style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF2D2D2D), //#2d2d2d
          ),
        body: ListView(
            children: [
            ListTile(
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  'https://png.pngtree.com/png-clipart/20250103/original/pngtree-businessman-icon-person-account-white-and-gray-vector-png-image_9713082.png',
                ),
                radius: 28,
              ),
              title: Text('empresa 1'),
        ),
        ]
    ),
  ),
  ),
  );
}
