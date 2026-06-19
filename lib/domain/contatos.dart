class Contatos {
  late String nome;
  late String info;
  late String time;
  late String foto;

  Contatos({
    required this.nome,
    required this.info,
    required this.time,
    required this.foto,

  });
  Contatos.fromJson(Map<String, dynamic> json) {
    nome = (json['nome']).toString();
    info = (json['info']).toString();
    time = (json['time']).toString();
    foto = (json['foto']).toString();
  }
}