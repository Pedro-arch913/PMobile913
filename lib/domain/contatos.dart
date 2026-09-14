class Contatos {
  late String nome;
  late String info;
  late String time;
  late double avaliacao;
  late String foto;

  Contatos({
    required this.nome,
    required this.info,
    required this.time,
    required this.avaliacao,
    required this.foto,
  });
  Contatos.fromJson(Map<String, dynamic> json) {
    nome = (json['nome']).toString();
    info = (json['info']).toString();
    time = (json['time']).toString();
    avaliacao = (json['avaliacao'] as num).toDouble();
    foto = (json['foto']).toString();
  }
}
