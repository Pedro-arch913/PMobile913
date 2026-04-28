import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b0b0b),
      appBar: AppBar(centerTitle: false,
        title: Text(
          "Inbox",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFF2d2d2d), //#2d2d2d
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              padding: EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                color: Color(0xff2a2a2a),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  foregroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
                  ),
                  radius: 20,
                  backgroundColor: Color(0x7CFFFFFF),
                ),
                title: Text(
                  "Empresa 1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "Lorem ipsum dolor sit amet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  '00:00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              padding: EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                color: Color(0xff2a2a2a),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  foregroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
                  ),
                  radius: 20,
                  backgroundColor: Color(0x7CFFFFFF),
                ),
                title: Text(
                  "Empresa 2",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "Lorem ipsum dolor sit amet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  '00:00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              padding: EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                color: Color(0xff2a2a2a),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  foregroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/5987/5987462.png',
                  ),
                  radius: 20,
                  backgroundColor: Color(0x7CFFFFFF),
                ),
                title: Text(
                  'Empresa 3',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  '00:00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
