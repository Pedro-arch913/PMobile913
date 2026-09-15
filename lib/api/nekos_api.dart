import 'package:dio/dio.dart';

class NekosApi {
  final dio = Dio();
  String baseUrl = 'https://api.nekosapi.com/v4';

  Future<List<String>> listarAvatares(int quantidade) async {
    int limite = quantidade * 3;
   
    }

    final response = await dio.get(
      '$baseUrl/images/random?rating=safe&limit=$limite',
    );

    List<String> avatares = [];

    if (response.statusCode == 200) {
      for (var json in response.data) {
        if (json['rating'] == 'safe') {
          avatares.add(json['url']);
        }
      }
    }

    return avatares;
  }
}
