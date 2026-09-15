import 'package:flutter/material.dart';
import 'package:pmobile913/domain/empresa.dart';
import 'package:pmobile913/screens/inbox_chat.dart';

class ContainerContato extends StatefulWidget {
  Empresa empresa;

  ContainerContato({super.key, required this.empresa});

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
                empresaId: widget.empresa.id,
                name: widget.empresa.nome,
                avatar: widget.empresa.avatar,
                info: widget.empresa.informacao,
                avaliacao: widget.empresa.avaliacao,
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
            foregroundImage: NetworkImage(widget.empresa.avatar),
            radius: 20,
            backgroundColor: Color(0x7CFFFFFF),
          ),
          title: Text(
            widget.empresa.nome,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            widget.empresa.informacao,
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
          trailing: Text(
            widget.empresa.horario,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}