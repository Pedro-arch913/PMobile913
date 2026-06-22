import 'package:flutter/material.dart';
import 'package:teste01/Pages/list_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int selectedIndex = 0;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'Trabalhadores Próximos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white12,
      ),
      body: const ListPage(),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar(){
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xFFF85800),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState((){
      selectedIndex = index;
      });
      },
      items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorar'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Mensagem'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
      ],
    );
  }
}