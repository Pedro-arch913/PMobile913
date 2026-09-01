import 'package:flutter/material.dart';
import 'package:pmobile913/domain/historico.dart';
import 'package:pmobile913/screens/historico_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerHistorico extends StatefulWidget {
  final Historico historico;

  const ContainerHistorico({
    super.key,
    required this.historico,
  });

  @override
  State<ContainerHistorico> createState() => _ContainerHistoricoState();
}

class _ContainerHistoricoState extends State<ContainerHistorico> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HistoricoDetail(
                historico: widget.historico,
              );
            },
          ),
        );
      },
      child: Card(
        // Mantém o card claro, sem alterar o fundo da página
        color: Colors.white10,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.15),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Imagem
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.historico.imagem,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 80,
                      width: 80,
                      color: Colors.grey.shade200,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey.shade500,
                        size: 30,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 14),

              // Informações
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.historico.servico,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF333333),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money_rounded,
                          size: 19,
                          color: Colors.green,
                        ),

                        const SizedBox(width: 3),

                        Text(
                          "R\$ ${widget.historico.preco}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Ícone indicando que o card é clicável
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
                color: Colors.grey.shade500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}