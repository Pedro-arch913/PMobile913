import 'package:flutter/material.dart';
import 'package:pmobile913/db/DadosDao.dart';
import 'package:pmobile913/domain/dados.dart';
import 'package:pmobile913/widget/container_dados.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Dados> listaDados = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final dados = await DadosDao().listarDados();
    if (!mounted) return;
    setState(() {
      listaDados = dados;
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (carregando) {
      return const Center(child: CircularProgressIndicator());
    }

    if (listaDados.isEmpty) {
      return const Center(
        child: Text(
          'Nenhum trabalhador encontrado.',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: loadData,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: listaDados.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, indent: 76, color: Colors.white12),
        itemBuilder: (context, i) {
          return ContainerDados(dados: listaDados[i]);
        },
      ),
    );
  }
}
