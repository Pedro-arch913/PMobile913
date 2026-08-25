import 'package:flutter/material.dart';
import 'package:pmobile913/db/HistoricoDao.dart';
import 'package:pmobile913/domain/historico.dart';
import 'package:pmobile913/widget/container_historico.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  List<Historico> listaHistorico = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final dados = await HistoricoDao().listarHistorico();
    if (!mounted) return;
    setState(() {
      listaHistorico = dados;
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Histórico',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: const Color(0xFF2D2D2D),
      ),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : listaHistorico.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhum serviço no histórico.',
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  itemCount: listaHistorico.length,
                  itemBuilder: (context, i) {
                    return ContainerHistorico(
                      historico: listaHistorico[i],
                    );
                  },
                ),
    );
  }
}
