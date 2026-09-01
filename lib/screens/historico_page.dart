import 'package:google_fonts/google_fonts.dart';
import 'package:pmobile913/db/HistoricoDao.dart';
import 'package:pmobile913/db/db_helper.dart';
import 'package:pmobile913/domain/historico.dart';
import 'package:pmobile913/widget/container_historico.dart';
import 'package:flutter/material.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  late Future<List<Historico>> futureListaHistorico;

  @override
  void initState() {
    super.initState();
    futureListaHistorico = HistoricoDao().listarHistorico();
  }

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
              "History",
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
      body: FutureBuilder(
        future: futureListaHistorico,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Historico> listaHistorico = snapshot.requireData;
            return buildListView(listaHistorico);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildListView(listaHistorico) {
    return ListView.builder(
      itemCount: listaHistorico.length,
      itemBuilder: (context, i) {
        return ContainerHistorico(historico: listaHistorico[i]);
      },
    );
  }
}