import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: false,
          title: Text('Inbox', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF2D2D2D), //#075E54

        ),
        body: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  '',

                ),
                radius: 28,
              ),
              title: Text('empresa 1'),
              subtitle: Text('Lorem ipsum dolor sit amet'),
              trailing: Text('00:00'),
            ),
            ListTile(
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  'https://rd1.com.br/wp-content/uploads/2019/12/20191208-capture-20191208-180048.png',
                ),
                radius: 28,
              ),
              title: Text('Varão'),
              subtitle: Text('Oi abencoada.. Vamos para culto de jovens.. '),
              trailing: Text('DOMINGO'),
            ),
            ListTile(
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0wXC8pn8WhfqhTsVWkfGho0mSKM5CFCgWrGtJGFUJtsxrS3V1QhB6UXv-Dc7sQjliTB67evWmWdr_V4g-xCdUz_z2zoZZOBMMX1gKfg&s=10',
                ),
                radius: 28,
              ),

              title: Text('Contatinho 412'),
              subtitle: Text('Oi linda.. Vamos tomar uma acai..'),
              trailing: Text('ONTEM'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
                ),
                title: Text("João Silva"),
                subtitle: Text("E aí, tudo bem?"),
                trailing: Text("12:45"),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
