import 'package:pmobile913/db/db_helper.dart';
import 'package:pmobile913/domain/contatos.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class ContatoDao {
  Future<List<Contatos>> listarContatos() async {
    Database db = await DBHelper().initDB();

    var result = await db.rawQuery('SELECT * FROM CONTATO');

    List<Contatos> lista = [];

    for (var json in result) {
      Contatos contatos = Contatos.fromJson(json);
      lista.add(contatos);
    }

    return lista;
  }
}
