import 'package:teste01/pages/nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavBar Exemplo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

