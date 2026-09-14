import 'package:flutter/material.dart';
import 'package:pmobile913/domain/dados.dart';
import 'package:pmobile913/screens/detail_page.dart';
import 'package:pmobile913/screens/trabalhador_chatbot.dart';

class ContainerDados extends StatefulWidget {
  Dados dados;

  ContainerDados({super.key, required this.dados});

  @override
  State<ContainerDados> createState() => _ContainerDadosState();
}

class _ContainerDadosState extends State<ContainerDados> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrabalhadorChatbot(
              trabalhador: widget.dados,
              apiKey:
                  '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',
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(widget.dados.urlImagem),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dados.nome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xFFFFC400),
                      ),
                      const SizedBox(width: 4),
                      Text(widget.dados.avaliacao),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
