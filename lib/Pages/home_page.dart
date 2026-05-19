import 'package:teste01/Pages/services_page.dart';
import 'package:teste01/Pages/profile_page.dart';
import 'package:teste01/pages/explore_page.dart';
import 'package:flutter/material.dart';
//1

  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    int selectedIndex = 0;
    List pages = [
      Center(child: Text('Pagina 1', style: TextStyle(fontSize: 32))),
      ExplorePage(),
      Center(child: Text('Pagina 3', style: TextStyle(fontSize: 32))),
      ProfilePage(),
    ];

    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: pages[selectedIndex],
        bottomNavigationBar: buildBottomNavBar(),
      );
    }

    buildBottomNavBar() {
      return BottomNavigationBar(
        backgroundColor: Color(0xFF2d2d2d),
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      );
    }
  }