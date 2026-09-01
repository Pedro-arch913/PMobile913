import 'package:flutter/material.dart';
import 'package:pmobile913/domain/contatos.dart';
import 'package:pmobile913/screens/chat.dart';

class ContainerContato extends StatefulWidget {
  Contatos contato;

  ContainerContato({super.key, required this.contato});

  @override
  State<ContainerContato> createState() => _ContainerContatoState();
}

class _ContainerContatoState extends State<ContainerContato> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Chat(
                name: widget.contato.nome,
                avatar: widget.contato.foto,
                info: widget.contato.info,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
          color: Color(0xFF2a2a2a),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(widget.contato.foto),
            radius: 20,
            backgroundColor: Color(0x7CFFFFFF),
          ),
          title: Text(
            widget.contato.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            widget.contato.info,
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
          trailing: Text(
            widget.contato.time,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}