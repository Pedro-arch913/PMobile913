import 'package:dio/dio.dart';

class NekosApi {
  final dio = Dio();
  String baseUrl = 'https://api.waifu.pics/sfw';

  Future<List<String>> listarAvatares(int quantidade) async {
    List<String> avatares = [];

    for (var i = 0; i < quantidade; i++) {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        avatares.add(response.data['url']);
      }
    }

    return avatares;
  }
}
