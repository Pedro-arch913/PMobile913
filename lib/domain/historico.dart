class Historico {
  late String imagem;
  late String servico;
  late String preco;

  Historico({
    required this.imagem,
    required this.servico,
    required this.preco,
  });

  Historico.fromJson(Map<String, dynamic> json) {
    imagem = json['imagem'].toString();
    servico = json['servico'].toString();
    preco = json['preco'].toString();
  }
}