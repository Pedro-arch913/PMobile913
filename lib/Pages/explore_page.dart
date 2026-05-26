import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../domain/Propriedade.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  List listaPropriedades = [

    Propriedade(
        urlImage: 'https://media.istockphoto.com/id/539115110/pt/foto/colosseum-em-roma-e-manh%C3%A3-de-sol-it%C3%A1lia.jpg?s=612x612&w=0&k=20&c=UJgNdZwEeoznZvOusoUoEtG6or5nweBNJxZbPxmi7dM=',
        local: 'Roma, Italy',
        host: '12-15 Jan',
        dates: 'Professional Host',
        total: '\$1,256 total'
    ),
    Propriedade(
      urlImage: 'https://afar.brightspotcdn.com/dims4/default/5e0f8f5/2147483647/strip/true/crop/5760x3056+0+0/resize/1440x764!/quality/90/?url=https%3A%2F%2Fk3-prod-afar-media.s3.us-west-2.amazonaws.com%2Fbrightspot%2F0e%2Fe0%2F2d5cbb2139b753c565850eda5611%2Foriginal-amsterdam-the-netherlands-canals-copy.jpg',
      local: 'Harligen, Netherlands',
      host: '18-23 Dec',
      dates: 'Professional Host',
      total: '\$1,065 total',
    ),
    Propriedade(
      urlImage: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/28/d5/c9/natural-pools-4-km-from.jpg',
      local: 'Maragogi, Brazil',
      host: 'Professional Host',
      dates: '10-23 Dec',
      total: '\$2,065 total',
    ),

  ]; //lista

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: ListView.builder(
        itemCount: listaPropriedades.length,
        itemBuilder: (context, i) {
          return buildContainer(propriedade: listaPropriedades[i]);
        },
      ),
    );
  }

  buildContainer({required Propriedade propriedade}) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              ClipRRect(
                child: Image.network(
                    propriedade.urlImage, height: 220, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8),
              ),
              Positioned(
                child: Icon(Icons.favorite, size: 36, color: Color(0xFFE41D56)),
                top: 16,
                right: 16,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  propriedade.local,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Row(children: [Icon(Icons.star, size: 16), Text('4.76')]),
            ],
          ),
          buildText(propriedade.host),
          buildText(propriedade.dates),
          buildText(propriedade.total),
        ],
      ),
    );


  }
  buildText(String text){
    return Text(text, style: GoogleFonts.inter());
  }
}
