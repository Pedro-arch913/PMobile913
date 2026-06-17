import 'package:flutter/material.dart';
import 'package:aula_913/domain/Historico.dart';
import 'package:aula_913/Pages/historico_page.dart';
import 'package:aula_913/Pages/historico_detail.dart';
import 'package:aula_913/Pages/services_page.dart';
import 'package:google_fonts/google_fonts.dart';



class ContainerHistorico extends StatefulWidget {
  Historico historico;

  ContainerHistorico({super.key, required this.historico});

  @override
  State<ContainerHistorico> createState() => _ContainerHistoricoState();
}

class _ContainerHistoricoState extends State<ContainerHistorico> {

  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HistoricoDetail(historico: widget.historico);
            },
          ),
        );
      },
    child: Container(margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              ClipRRect(
                child: Image.network(widget.historico.imagem,
                height: 100,
                fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.historico.preco),


            ],
          ),
          buildText(widget.historico.servico),

        ],
      ),

    )
    );
    onTapContainer(){}

  }

  buildText(String text) {
    return Text(text, style: GoogleFonts.inter());
  }

}