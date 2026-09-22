import 'package:dio/dio.dart';

class NekosApi {
  String baseUrl = 'https://api.dicebear.com/10.x/adventurer/png';

  Future<List<String>> listarAvatares(int quantidade) async {
    List<String> avatares = [];

    for (var i = 0; i < quantidade; i++) {
      avatares.add('$baseUrl?seed=empresa-$i&size=200');
    }

    return avatares;
  }
}
