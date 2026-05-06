import 'package:flutter/material.dart';
import 'chat.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  int selectedIndex = 2;

  final List<Map<String, String>> conversations = [
    {
      'name': 'Empresa 1',
      'message': 'Lorem ipsum dolor sit amet',
      'time': '09:45',
      'avatar': 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
      'info': 'Company info 1',
    },
    {
      'name': 'Empresa 2',
      'message': 'Lorem ipsum dolor sit amet',
      'time': '10:30',
      'avatar': 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
      'info': 'Company info 2',
    },
    {
      'name': 'Empresa 3',
      'message': 'Lorem ipsum dolor sit amet',
      'time': '11:00',
      'avatar': 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
      'info': 'Company info 3',
    },
    {
      'name': 'Empresa 4',
      'message': 'Lorem ipsum dolor sit amet',
      'time': '09:45',
      'avatar': 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
      'info': 'Company info 4',
    },
    {
      'name': 'Empresa 5',
      'message': 'Lorem ipsum dolor sit amet',
      'time': '10:30',
      'avatar': 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
      'info': 'Company info 5',
    },
    {
      'name': 'Empresa 6',
      'message': 'Lorem ipsum dolor sit amet',
      'time': '11:00',
      'avatar': 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
      'info': 'Company info 6',
    },
  ];

  Widget _buildConversationTile(Map<String, String> item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        color: Color(0xFF2a2a2a),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chat(
                name: item['name']!,
                avatar: item['avatar']!,
                info: item['info']!,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          foregroundImage: NetworkImage(item['avatar']!),
          radius: 20,
          backgroundColor: Color(0x7CFFFFFF),
        ),
        title: Text(
          item['name']!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          item['message']!,
          style: TextStyle(color: Colors.white70, fontSize: 15),
        ),
        trailing: Text(
          item['time']!,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b0b0b),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Inbox",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Color(0xFF2d2d2d),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          return _buildConversationTile(conversations[index]);
        },
      ),
    );
  }
}