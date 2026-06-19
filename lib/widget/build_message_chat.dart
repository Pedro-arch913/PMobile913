import 'package:flutter/material.dart';

class BuildMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  const BuildMessage({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 250),
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Color(0xFFFF6B00) : Color(0xFF1F1F1F),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}