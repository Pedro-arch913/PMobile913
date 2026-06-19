import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: Color(0xFF282829),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Services",
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
        actions: [
          Container(child: Icon(Icons.menu, size: 40, color: Colors.white)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_outlined),
              hintText: 'Search a service',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 39, 24, 21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 25),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Great Services",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Image.asset(
                  'assets/great_service-image.png',
                  width: 120,
                  height: 120,
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.only(top: 20)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 99, 27, 27),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 25),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Small Services",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Image.asset(
                  'assets/small_service-image.png',
                  width: 120,
                  height: 120,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
