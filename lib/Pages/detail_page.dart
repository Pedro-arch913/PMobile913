import 'package:teste01/domain/dados.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget{
  final Dados dados;

  const DetailPage({super.key, required this.dados});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>{
  Dados get dados => widget.dados;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(dados.urlImagem,
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover),
              Positioned(
                left: 16,
                top: 16,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dados.nome,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Color(0xFFE41D56)),
                    const SizedBox(width: 4),
                    Text(dados.avaliacao),
                  ],
                ),
                const SizedBox(height: 16),
                Text(dados.informacoes, style: const TextStyle(fontSize: 15)),
              ],
            )
          )
        ],
      ),
    );
  }
}