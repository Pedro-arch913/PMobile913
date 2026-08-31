//if it starts with an uppercase letter, it's a Widget
//if it starts with a downcase letter, it's an argument
//arguments go in Widgets, widgets go in arguments
//The child is what is inside the Widget

import 'package:flutter/material.dart';
import 'package:pmobile913/screens/confirm_page.dart';
import 'package:pmobile913/screens/detail_page.dart';
import 'package:pmobile913/domain/dados.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text(
          'Pedido de Sr. Manoel',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Imagem:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(4),
          ),
          Card(
            child: Image.asset(
              'assets/imagens/download.jpg',
              width: 400,
              height: 200,
            ),
          ),
          Container(
            child: Text(
              'Informações Gerais:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Estou precisando da ajuda de algum profissional '
              'que consiga fazer manutenção em disjuntores elétricos '
              'residenciais.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Container(
            child: Text(
              'Informações Complementares:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Tenho algumas informações adicionais: a primeira é '
              'que eu gostaria que o serviço fosse feito durante a manhã, '
              'pois é o horário que trabalho fora de casa por mais tempo e '
              'não uso os eletrodomésticos. Pagarei um adicional extra se '
              'já estiver pronto quando eu voltar para o almoço.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                dados: Dados(
                  urlImagem: 'assets/imagens/download.jpg',
                  informacoes:
                      'Estou precisando da ajuda de algum profissional '
                      'que consiga fazer manutenção em disjuntores elétricos '
                      'residenciais.',
                  nome: 'Sr. Manoel',
                  avaliacao: '4.5',
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
