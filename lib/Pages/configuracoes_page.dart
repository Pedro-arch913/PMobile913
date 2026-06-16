import 'package:flutter/material.dart';
import 'package:teste01/Pages/services_page.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Background
      appBar: AppBar(centerTitle: false,
        title: Text('Configurações',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Color(0xFF2d2d2d
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView());
  }
}