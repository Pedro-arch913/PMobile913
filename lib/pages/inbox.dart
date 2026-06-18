import 'package:flutter/material.dart';
import 'package:teste01/db/ContatoDao.dart';
import 'package:teste01/domain/contatos.dart';
import '../widget/container_contatos.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  int selectedIndex = 2;
  final ContatoDao _contatoDao = ContatoDao();
  late Future<List<Contatos>> _contatosFuture;

  @override
  void initState() {
    super.initState();
    _contatosFuture = _contatoDao.listarContatos();
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF2d2d2d),
      currentIndex: selectedIndex,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Inbox'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
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
      bottomNavigationBar: _buildBottomNavBar(),
      body: FutureBuilder<List<Contatos>>(
        future: _contatosFuture,
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