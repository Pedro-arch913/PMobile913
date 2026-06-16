import 'package:flutter/material.dart';
import 'package:teste01/Pages/configuracoes_page.dart';
import 'package:teste01/Pages/services_page.dart';

class ContainerConfiguracoes extends StatefulWidget {
  const ContainerConfiguracoes({super.key});

  @override
  State<ContainerConfiguracoes> createState() => _ContainerConfiguracoesState();
}

class _ContainerConfiguracoesState extends State<ContainerConfiguracoes> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ConfiguracoesPage(configuracoes: widget.configuracoes);
        },
        ),
        );
      },
    child: Container(margin: EdgeInsets.all(16)
    )
    );
  }
}