import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmobile913/api/empresas_api.dart';
import 'package:pmobile913/api/nekos_api.dart';
import 'package:pmobile913/domain/empresa.dart';
import 'package:pmobile913/widget/container_contato_chat.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  late Future<List<Empresa>> futureEmpresas;

  @override
  void initState() {
    super.initState();
    futureEmpresas = carregarEmpresas();
  }

  Future<List<Empresa>> carregarEmpresas() async {
    List<Empresa> empresas = await EmpresasApi().listarEmpresas();
    List<String> avatares = await NekosApi().listarAvatares(empresas.length);

    for (var i = 0; i < empresas.length; i++) {
      if (i < avatares.length) {
        empresas[i].avatar = avatares[i];
      }
    }

    return empresas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mensagens",
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
        future: futureEmpresas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Empresa> listaEmpresas = snapshot.requireData;
            return buildListView(listaEmpresas);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildListView(listaEmpresas) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 14, top: 20, right: 14),
      itemCount: listaEmpresas.length,
      itemBuilder: (context, i) {
        return ContainerContato(empresa: listaEmpresas[i]);
      },
    );
  }
}