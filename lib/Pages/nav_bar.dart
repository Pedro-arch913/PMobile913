import 'package:flutter/material.dart';

// Telas
import 'tela_config.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexAtual = 0;

  final List<Widget> _telas = [
    TelaConfig(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _indexAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indexAtual],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexAtual,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),

        ],
      ),
    );
  }
}