import 'package:flutter/material.dart';
import 'package:teste01/Tela02.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                color: Colors.grey[900],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Text(
                      'Lista de Pedidos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                ),
              ),
          Expanded(
           flex: 2,
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Pedido de Sr. Manoel'),
                  subtitle: Text(
                      'Estou precisando da ajuda de alguma equipe profissional '
                          'que consiga fazer manutenção em disjuntores elétricos '
                          'residenciais, o meu não está ligando e não sei o que posso'
                          ' fazer.'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Pedido de Sra. Martha'),
                  subtitle: Text(
                      'Preciso de alguém que saiba consertar pias de '
                          'cozinha ajustáveis. Acordei hoje e vi que tem um vazamento'
                          'por trás do armário da cozinha, preciso de um encanador.'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Pedido de Sra. Amanda'),
                  subtitle: Text(
                      'Preciso de uma equipe de detetização urgente. '
                          'Minha casa está infestada de cupins e comendo todos os móveis.'),
                ),
              ),
              Card(
                child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Pedido de Sr. Carlos'),
                    subtitle: Text(
                        'Gostaria da ajuda de algum eletricista. Aqui na '
                            'minha loja choveu muito semana passada e agora várias luzes '
                            'estão queimadas, preciso que consertem a fiação o quanto antes.')
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Pedido de Sr. Manolo'),
                  subtitle: Text(
                      'Estou precisando de uma equipe que consiga escavar'
                          'mais alguns metros da cacimba aqui do sítio, ela está muito rasa'
                          'e a água está acabando rápido. Como não sei qual será a profundidade '
                          'necessária, pagarei pelo metro escavado.'),
                ),
              ),
              ],
              ),
      ),

              Expanded(
                flex: 3,
              child: Container(
              padding: EdgeInsets.all(16),
        color: Colors.grey[900],
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pedido de Sr. Manoel',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Estou precisando da ajuda de alguma equipe profissional.', style: TextStyle(fontSize: 18),),
        SizedBox(height: 10),
        Container(
          height: 120,
          width: 300,
          child: Image.asset(
            'imagens/download.jpg', fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Text('Tenho algumas informações adicionais: a primeira é '
            'que eu gostaria que o serviço fosse feito durante a manhã, '
            'pois é o horário que trabalho fora de casa por mais tempo e '
            'não uso os eletrodomésticos. Pagarei um adicional extra se '
            'já estiver pronto quando eu voltar para o almoço.', style: TextStyle(fontSize: 16),),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tela02(),
                  ),
                );
              },
              child: Text('Confirmar pedido'),
            )
          ]
      ),
      ),
          ),
    ],
    ),
      ),
      ),
    );
     }
}

