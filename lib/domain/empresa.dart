class Empresa {
  late int id;
  late String nome;
  late String informacao;
  late String horario;
  late double avaliacao;
  late String avatar;

  Empresa({
    required this.id,
    required this.nome,
    required this.informacao,
    required this.horario,
    required this.avaliacao,
    required this.avatar,
  });

  Empresa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    informacao = json['informacao'];
    horario = json['horario'];
    avaliacao = json['avaliacao'].toDouble();
    avatar = '';
  }
}