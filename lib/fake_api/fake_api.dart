import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:teste01/domain/user.dart';

class FakeApi{
  Future<List<User>> getUsers() async{
    final String jsonString = await rootBundle.loadString('assets/db.json');
    final Map<String, dynamic> data = jsonDecode(jsonString);
    final List usersJson = data['users'];
    return usersJson.map((u) => User.fromJson(u)).toList();
  }

  Future<User?> login(String email, String password) async{
    await Future.delayed(const Duration(milliseconds: 600));

    final users = await getUsers();
    for (final user in users){
      if(user.email == email && user.password == password){
        return user;
      }
    }
    return null;
  }
}