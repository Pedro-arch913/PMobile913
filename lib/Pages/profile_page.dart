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
      appBar: AppBar(centerTitle: false,
      title: Text('Profile',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24
      ),
      ),
        backgroundColor: Color(0xFF2d2d2d
        ),
      ),
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
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF2d2d2d),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Text(
                    'Nome De Usuário',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),


              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 1, left: 4, right: 4),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                color: Color(0xFF666666),
                borderRadius: BorderRadius.circular(12),
              ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email:', style: TextStyle(color: Colors.white),),
                    Text('Telefone:', style: TextStyle(color: Colors.white),),

                  ],
                )
                ),
            ],
          ),
      );
  }
}