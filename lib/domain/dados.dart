class Dados {
  late String urlImagem;
  late String informacoes;
  late String nome;
  late String avaliacao;

  Dados({
    required this.urlImagem,
    required this.informacoes,
    required this.nome,
    required this.avaliacao,
  });

  Dados.fromJson(Map<String, dynamic> json){
    urlImagem = json['urlimagem'];
    informacoes = json['informacoes'];
    nome = json['nome'];
    avaliacao = json['avaliacao'].toString();
  }
}