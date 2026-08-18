import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),

        appBar: AppBar(
          backgroundColor: Color(0xFF282829),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Inbox",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Color(0xFFff6b00),
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),

        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "No messages yet",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(height: 15),
              Icon(
                Icons.speaker_notes_off_sharp,
                size: 80,
                color: Colors.white,
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "Request your first service to start a chat. You can have conversations here if you want.",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF282829),
          unselectedItemColor: Color(0xFF7A7A7A),
          selectedItemColor: Color(0xFFff6b00),
          currentIndex: 2,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    ),
  );
}
