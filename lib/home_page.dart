import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Inbox', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF2D2D2D), //#075E54
        ),
        body: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  'https://s2.glbimg.com/VwRVdVa5XGrVcKehDDXqWmr4eYo=/620x620/smart/e.glbimg.com/og/ed/f/original/2021/12/14/246050622_271545034866773_2339200188116438935_n.jpg',
                ),
                radius: 28,
              ),
              title: Text('Contatinho 913'),
              subtitle: Text('Oi sumida rsrs'),
              trailing: Text('ONTEM'),
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
          ],
        ),
      ),
    ),
  );
}
