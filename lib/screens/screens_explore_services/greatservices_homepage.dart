import 'package:pmobile913/db/serviceDAO.dart';
import 'package:pmobile913/domain/services.dart';
import 'package:pmobile913/widget/service_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class GreatServHomePage extends StatefulWidget {
  const GreatServHomePage({super.key});

  @override
  State<GreatServHomePage> createState() => _ConfigGreatServ();
}

class _ConfigGreatServ extends State<GreatServHomePage> {
  List<Services> listaServices = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaServices = await ServiceDAO().listarService();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: Color(0xFF282829),
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Great Services",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),


      body: ListView.builder(
        itemCount: listaServices.length,
        itemBuilder: (context, i) {
          return ServiceContainer(services: listaServices[i]);
        },
      ),
    );
  }
}
