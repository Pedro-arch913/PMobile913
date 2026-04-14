import 'package:flutter/material.dart';
//1

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
        children: [
          Text("tela config")

    ],
        ),
    );
  }
}