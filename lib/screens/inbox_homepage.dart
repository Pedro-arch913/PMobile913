import 'package:flutter/material.dart';
import 'package:pmobile913/db/ContatoDao.dart';
import 'package:pmobile913/domain/contatos.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmobile913/widget/container_contato_chat.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final ContatoDao contatoDao = ContatoDao();

  List<Contatos> listaContatos = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaContatos = await contatoDao.listarContatos();
    setState(() {});
  }

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

      body: ListView.builder(
        padding: const EdgeInsets.only(left:14, top: 20, right: 14),
        itemCount: listaContatos.length,
        itemBuilder: (context, i) {
          return ContainerContato(contato: listaContatos[i]);
        },
      ),
    );
  }
}
