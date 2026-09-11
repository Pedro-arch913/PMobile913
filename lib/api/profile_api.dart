import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pmobile913/domain/profile.dart';

class ProfileApi {
  static const String _url = 'https://randomuser.me/api/';

  Future<Profile> buscarProfile() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Profile.fromJson(data);
    } else {
      throw Exception('Falha ao carregar perfil: ${response.statusCode}');
    }
  }
}