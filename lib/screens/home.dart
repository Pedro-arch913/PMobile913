import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens_explore_services/greatservices_homepage.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({super.key});

  @override
  State<InicialPage> createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Início",
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
                border: ShapedInputBorder(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                hintText: 'Pesquisar Serviços',
                hintStyle: GoogleFonts.inter(fontSize: 14),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Serviços em Destaque',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GreatServHomePage(),
                    ),
                  );
                },
                child: Text(
                  'Ver todos',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _serviceCard(
                  image: 'assets/great_service-image.png',
                  title: 'Construct your own\nhome',
                ),
                _serviceCard(
                  image: 'assets/small_service-image.png',
                  title: 'Replacing the slab\nof your house',
                ),
                _serviceCard(
                  image: 'assets/great_service-image.png',
                  title: 'Install the electrical\nsystem in your home.',
                ),
                _serviceCard(
                  image: 'assets/small_service-image.png',
                  title: 'Install the water\nsystem',
                ),
                _serviceCard(
                  image: 'assets/great_service-image.png',
                  title: 'Painting your\nhouse',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceCard({required String image, required String title}) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 115,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
