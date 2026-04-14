import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
            children: [Padding(padding: EdgeInsets.only(top: 40),
              child: Center(
                child: CircleAvatar( foregroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3106/3106921.png'),
                  backgroundColor: Color(0xFF6F6F6F),
                  radius: 100,
                  ),
                  ),
                ),
              SizedBox(height: 15),
              Text('Nome De Usuário',textAlign: TextAlign.center, style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,
                color: Colors.white,


              ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(12),
              ),
              ),
            ],
          ),
      );
  }
}