import 'package:dio/dio.dart';
import 'package:pmobile913/domain/historico.dart';

class HistoricoApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/Pedro-arch913/fake_api';

  Future<List<Historico>> listarHistorico() async {
    late List<Historico> listaHistorico;
    final response = await dio.get('$baseUrl/historico');

    if (response.statusCode == 200) {
      List listJson = response.data;
      listaHistorico = listJson.map((json) => Historico.fromJson(json)).toList();
      return listaHistorico;
    } else {
      throw Exception('Falha ao carregar o histórico');
    }
  }
}