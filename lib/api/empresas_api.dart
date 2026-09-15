import 'package:dio/dio.dart';
import 'package:pmobile913/domain/empresa.dart';

class EmpresasApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/isaackje/fake_api';

  Future<List<Empresa>> listarEmpresas() async {
    final response = await dio.get('$baseUrl/empresas');

    List<Empresa> lista = [];

    if (response.statusCode == 200) {
      for (var json in response.data) {
        Empresa empresa = Empresa.fromJson(json);
        lista.add(empresa);
      }
    }

    return lista;
  }
}
