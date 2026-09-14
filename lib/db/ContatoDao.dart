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

  Future<void> atualizarContato(
    int id, {
    required String nome,
    required String info,
    required String time,
    required double avaliacao,
    required String foto,
  }) async {
    Database db = await DBHelper().initDB();

    await db.update(
      'CONTATO',
      {
        'nome': nome,
        'info': info,
        'time': time,
        'avaliacao': avaliacao,
        'foto': foto,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
