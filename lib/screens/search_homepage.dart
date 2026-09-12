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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explorar",
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
        padding: const EdgeInsets.all(14),
        children: [
          Container(
            height: 46,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
            child: TextField(
              style: GoogleFonts.inter(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                hintText: 'Pesquisar Serviços',
                hintStyle: GoogleFonts.inter(fontSize: 14),
                prefixIcon: Icon(Icons.search),
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
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 14),
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
                  width: 90,
                  height: 90,
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
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 14),
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
                  width: 90,
                  height: 90,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
