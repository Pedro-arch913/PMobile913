import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens_explore_services/greatservices_homepage.dart';

class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key});

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),

      appBar: AppBar(
        backgroundColor: Color(0xFF282829),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore",
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GreatServHomePage()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Great Services",
                  style: TextStyle(
                    fontSize: 30,
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
                    fontSize: 30,
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
