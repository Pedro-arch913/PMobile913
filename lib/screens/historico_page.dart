import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmobile913/api/historico_api.dart';
import 'package:pmobile913/domain/historico.dart';
import 'package:pmobile913/widget/container_historico.dart';

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
    futureListaHistorico = HistoricoApi().listarHistorico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF282829),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "History",
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xFFff6b00),
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Historico>>(
        future: futureListaHistorico,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Historico> listaHistorico = snapshot.requireData;
            return buildListView(listaHistorico);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Erro ao carregar histórico",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFff6b00),
            ),
          );
        },
      ),
    );
  }

  Widget buildListView(List<Historico> listaHistorico) {
    return ListView.builder(
      itemCount: listaHistorico.length,
      itemBuilder: (context, i) {
        return ContainerHistorico(historico: listaHistorico[i]);
      },
    );
  }
}