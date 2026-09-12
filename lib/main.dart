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
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF121212),
          surface: Color(0xFF1E1E1E),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),

      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF2d2d2d),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.white,
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
