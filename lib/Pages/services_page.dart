import 'package:flutter/material.dart';


class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ConfigState();
}

class _ConfigState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false,
        title: Text('Offer your services',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Color(0xFF2d2d2d
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only( left: 15, right: 8,top: 20),
            child: Text('what do plan to use TecPro?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 1, left: 15, right: 15),
            child: Text('More than one option can be selected.',style: TextStyle(
                fontSize: 19, color: Colors.white24)
              ,),
          ),

          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(bottom: 1, left: 15, right: 15, top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF1c1d1f),
                borderRadius: BorderRadius.circular(9),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Text('My primary job or business', style: TextStyle(color: Colors.white, fontSize: 15),),
                  Icon(Icons.work, color: Colors.white,size: 15,)

                ],
              )
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(bottom: 1, left: 15, right: 15, top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF1c1d1f),
                borderRadius: BorderRadius.circular(9),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Text('A side project or business', style: TextStyle(color: Colors.white, fontSize: 15),),
                  Icon(Icons.build, color: Colors.white,size: 15,)

                ],
              )
          ),

          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(bottom: 1, left: 15, right: 15, top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF1c1d1f),
                borderRadius: BorderRadius.circular(9),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Text('Personal use', style: TextStyle(color: Colors.white, fontSize: 15),),
                  Icon(Icons.person, color: Colors.white,size: 15,)

                ],
              )
          ),


        ],
      ),
        );
  }
}