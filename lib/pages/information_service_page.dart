import 'package:flutter/material.dart';

class InformationServicePage extends StatefulWidget {
  const InformationServicePage({super.key});

  @override
  State<InformationServicePage> createState() => _InformationServicePageState();
}

class _InformationServicePageState extends State<InformationServicePage> {
  bool switchAtivo = false;
  int paginaAtual = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text ('Worker Statistics'),
        centerTitle: false,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        actions: [
          Switch(
            value: switchAtivo,
            activeColor: Colors.orange,
            inactiveThumbColor: Colors.grey,
            activeTrackColor: Colors.orange.withAlpha(100),
            onChanged: (value) {
              setState(() {
                switchAtivo = value;
              });
            },
          ),
          Icon(Icons.menu, size: 40, color: Colors.white),
        ],

      ),
      body: Column(
        children: [
          buildCardPerfil(),
          buildCardDescricao(),
          buildBarraMensagem(),
        ],
      ),

      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildCardPerfil() {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[600],
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),

          SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text (
                'Lorem Ipsum Dolor',
                style : TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text (
                'Professional type: ',
                style : TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400]
                ),
              ),
              Text (
                'Professional info: ',
                style : TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildCardDescricao() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.handyman, color: Colors.orange, size: 24,),

          SizedBox(width: 12),

          Expanded(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                  'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
              style: TextStyle(color: Colors.grey[300], fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildBarraMensagem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          Icon(Icons.mail_outline, color: Colors.grey[500], size: 22,),

          SizedBox(width: 12),

          Text(
            'Lorem ipsum dolor sit amet',
            style : TextStyle(color : Colors.grey[300], fontSize: 13),
          ),
        ],
      ),
    );
  }
  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: paginaAtual,
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey[500],
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.handyman), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}