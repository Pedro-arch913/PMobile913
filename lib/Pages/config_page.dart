import 'package:flutter/material.dart';
import 'package:teste01/domain/Configs.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  List listaConfigs = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false,
        title: Text('Settings',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Color(0xFF2d2d2d
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: listaConfigs.length,
        itemBuilder: (context, i) {
          return buildContainer(configs: listaConfigs[i]);
        },
      ),
    );
  }
  buildContainer({required Configs configs}){
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
        Stack(
        fit: StackFit.passthrough,
        children: [
          ClipRRect(
            child: Image.network(
                configs.iconConfig, height: 20, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
      SizedBox(height: 8),
        ],
      ),

    );

  }


}
