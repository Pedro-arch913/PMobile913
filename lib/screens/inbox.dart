import 'package:flutter/material.dart';
import 'package:pmobile913/db/ContatoDao.dart';
import 'package:pmobile913/domain/contatos.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0b0b0b),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Inbox",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Color(0xFF2d2d2d),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listaContatos.length,
        itemBuilder: (context, i) {
          return ContainerContato(contato: listaContatos[i]);
        },
      ),
    );
  }
}
