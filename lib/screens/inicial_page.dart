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
      backgroundColor: const Color(0xFF111111),


      appBar: AppBar(
        backgroundColor: Color(0xFF282829),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Home",
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

      // BODY
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [

          // SEARCH
          Container(
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF2B2B2B),
              borderRadius: BorderRadius.circular(9),
            ),
            child: TextField(
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
              ),

              decoration: InputDecoration(
                border: InputBorder.none,

                hintText: 'Search Services',

                hintStyle: GoogleFonts.inter(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),

                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // TÍTULO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Services',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const GreatServHomePage(),
                    ),
                  );
                },

                child: Text(
                  'See all',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // LISTA DE SERVIÇOS
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

  // CARD DE SERVIÇO
  Widget _serviceCard({
    required String image,
    required String title,
  }) {
    return Container(
      width: 150,

      margin: const EdgeInsets.only(
        right: 8,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(3),
      ),

      clipBehavior: Clip.antiAlias,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // IMAGEM
          Image.asset(
            image,
            height: 115,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // TEXTO ABAIXO DA IMAGEM
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),

              child: Text(
                title,

                maxLines: 3,

                overflow: TextOverflow.ellipsis,

                style: GoogleFonts.inter(
                  color: Colors.white,
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
