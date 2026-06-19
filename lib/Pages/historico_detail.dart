import 'package:aula_913/db/db_helper.dart';
import 'package:aula_913/domain/Historico.dart';
import 'package:flutter/material.dart';


class HistoricoDetail extends StatefulWidget {
  Historico historico;

  HistoricoDetail({super.key, required this.historico});

  @override
  State<HistoricoDetail> createState() => _HistoricoDetailState();
}

class _HistoricoDetailState extends State<HistoricoDetail> {
  @override
  Historico get historico => widget.historico;


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false,
        title: Text('Detalhes do serviço',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Color(0xFF2d2d2d
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(historico.imagem),
            ],
          )
        ],
      ),
    );
  }
  buildContainer({required Historico historico}){
    return Container(
      margin: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
        Stack(
        fit: StackFit.passthrough,
        children: [
          ClipRRect(
            child: Image.network(
                historico.imagem, height: 20, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
      SizedBox(height: 8),
          Stack(
              children: [
                Text(widget.historico.servico,
                style: TextStyle(
                color: Colors.white,
                fontSize: 16
                 ),
              ),
                Text(widget.historico.preco,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16
                  ),
                ),
            ]
          ),
        ],
      ),

    );

  }


}
