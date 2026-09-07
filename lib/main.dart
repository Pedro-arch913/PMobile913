import 'package:flutter/material.dart';
import 'package:pmobile913/screens/history_homepage.dart';
import 'package:pmobile913/screens/home.dart';
import 'package:pmobile913/screens/request_page.dart';
import 'package:pmobile913/screens/search_homepage.dart';
import 'package:pmobile913/screens/inbox_homepage.dart';
import 'package:pmobile913/screens/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFF6B35),
          surface: Color(0xFFFFFFFF),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),

      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFFFF6B35),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.house_outlined),
              activeIcon: Icon(Icons.house),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Explorar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              activeIcon: Icon(Icons.message),
              label: 'Mensagens',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_outlined),
              activeIcon: Icon(Icons.history),
              label: 'Histórico',
            ),
          ],
        ),

        body: IndexedStack(
          index: _selectedIndex,
          children: [
            InicialPage(),
            SearchHomePage(),
            Inbox(),
            ProfilePage(),
            HistoricoPage(),
          ],
        ),
      ),
    );
  }
}
