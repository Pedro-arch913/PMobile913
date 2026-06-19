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
  late Future<List<Contatos>> contatosFuture;

  @override
  void initState() {
    super.initState();
    contatosFuture = contatoDao.listarContatos();
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
      body: FutureBuilder<List<Contatos>>(
        future: contatosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar contatos: ${snapshot.error}',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final contatos = snapshot.data ?? [];

          if (contatos.isEmpty) {
            return Center(
              child: Text(
                'Nenhum contato encontrado',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            itemCount: contatos.length,
            itemBuilder: (context, index) {
              return ContainerContato(contato: contatos[index]);
            },
          );
        },
      ),
    );
  }
}
