import 'package:teste01/db/DadosDao.dart';
import 'package:teste01/domain/dados.dart';
import 'package:teste01/widget/container_dados.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget{
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>{
  List<Dados> listaDados = [];

  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{
    listaDados = await DadosDao().listarDados();
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
        itemCount: listaDados.length,
        itemBuilder: (context, i){
          return Column(
            children: [
              ContainerDados(dados: listaDados[i]),
              if (i < listaDados.length - 1)
                const Divider(height: 1, indent: 76),
            ],
          );
        },
      ),
    );
  }
}