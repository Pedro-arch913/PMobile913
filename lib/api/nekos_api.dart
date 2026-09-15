import 'package:dio/dio.dart';

class NekosApi {
  final dio = Dio();
  String baseUrl = 'https://api.nekosapi.com/v4';

  Future<List<String>> listarAvatares(int quantidade) async {
    // Pede mais imagens do que o necessário porque nem toda imagem
    // marcada como "safe" pela API é usada.
    int limite = quantidade * 3;
    if (limite > 100) {
      limite = 100;
    }

    final response = await dio.get(
      '$baseUrl/images/random?rating=safe&limit=$limite',
    );

    List<String> avatares = [];

    if (response.statusCode == 200) {
      for (var json in response.data) {
        if (json['rating'] == 'safe' && avatares.length < quantidade) {
          avatares.add(json['url']);
        }
      }
    }

    return avatares;
  }
}