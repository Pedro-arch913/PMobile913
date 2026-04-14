  import 'package:teste01/Pages/config.dart';
import 'package:teste01/Pages/profile_page.dart';
import 'package:teste01/pages/explore_page.dart';
  import 'package:flutter/material.dart';


  class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    int selectedIndex = 0;
    List pages = [
      ExplorePage(),
      Center(child: Text('Pagina 1', style: TextStyle(fontSize: 32))),
      Config(),
      Center(child: Text('Pagina 3', style: TextStyle(fontSize: 32))),
      ProfilePage(),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisar',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: buildBottomNavBar(),
      );
    }

    buildBottomNavBar() {
      return BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Color(0xFFE41D56),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Trips'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      );
    }
  }