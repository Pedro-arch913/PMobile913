import 'package:flutter/material.dart';


class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: ListView(
        children: [
          Text("tela config", textAlign: TextAlign.center, style: TextStyle(fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white),
          ),

    ],
        ),
    );
  }
}