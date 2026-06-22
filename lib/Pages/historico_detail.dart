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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Detalhes do Serviço',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF2d2d2d),
      ),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20
              /*bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),*/
            ),
            child: Image.network(
              historico.imagem,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:  EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      historico.servico,
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                     SizedBox(height: 15),

                    Text(
                      "Preço",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),

                     SizedBox(height: 5),

                    Text(
                      "R\$ ${historico.preco}",
                      style:  TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

