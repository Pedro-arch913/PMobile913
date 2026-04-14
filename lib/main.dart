import 'package:flutter/material.dart';
import 'package:teste01/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF0b0b0b),
          appBar: AppBar(centerTitle: false,
            title: Text('Inbox', style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF2D2D2D), //#2d2d2d

          ),
        body: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  color: Color(0xFF3c3c3c),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(
                      '',
                    ),
                    radius: 20,
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
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text('00:00', style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  color: Color(0xFF3c3c3c),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(
                      '',
                    ),
                    radius: 20,
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
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Text('00:00', style: TextStyle(color: Colors.white)),
                ),
              ),
    Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        padding: EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: Color(0xFF3c3c3c),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
                leading: CircleAvatar(
                  foregroundImage: NetworkImage(
                    '',
                  ),
                  radius: 20,
                ),
          title: Text(
            "Empresa 3",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            "Lorem ipsum dolor sit amet",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
                trailing: Text(
                  "Lorem ipsum dolor sit amet",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
        ]
     ),
    ),
   ),
  );
}
