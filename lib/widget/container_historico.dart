import 'package:flutter/material.dart';
import 'package:pmobile913/domain/historico.dart';
import 'package:pmobile913/screens/historico_page.dart';
import 'package:pmobile913/screens/historico_detail.dart';
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
      child: Card(
        color: Colors.grey,
        elevation: 5,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(padding: EdgeInsets.all(12),
          child: Row(

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(widget.historico.imagem,height: 80,width: 80,
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(width: 12),

              Expanded(child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.historico.servico,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(width: 8),

                  Text("R\$ ${widget.historico.preco}",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),)
                ],
              )
              )
            ],
          ),
        ),

      ),
    );
    onTapContainer(){}

  }

  buildText(String text) {
    return Text(text, style: GoogleFonts.inter());
  }

}