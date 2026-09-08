import 'package:dio/dio.dart';

class AddressApi {

  final dio = Dio();
  findByUf(String municipio) async {
    final response = await dio.get('http://ifal.edu.br');
    print(response.statusCode);
    print(response.data);



  }
}