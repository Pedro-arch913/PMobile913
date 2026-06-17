import 'package:aula_913/db/Historico_dao.dart';
import 'package:aula_913/db/db_helper.dart';
import 'package:aula_913/domain/Historico.dart';
import 'package:aula_913/widget/container_historico.dart';
import 'package:flutter/material.dart';


class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  @override
  List<Historico> listaHistorico = [];

  Widget build(BuildContext context) {

    DBHelper().initDB();
    HistoricoDao().listarHistorico();
    return Scaffold(
      appBar: AppBar(centerTitle: false,
        title: Text('Historico',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Color(0xFF2d2d2d
        ),
      ),
      //conteudo
      body: ListView.builder(
        itemCount: listaHistorico.length,
        itemBuilder: (context, i) {
          return ContainerHistorico(historico: listaHistorico[i]);
        },
      ),

    );
  }
  }

