import 'package:pmobile913/domain/dados.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pmobile913/db/db_helper.dart';

class DadosDao {
  Future<List<Dados>> listarDados() async {
    Database db = await DBHelper().initDB();

    var result = await db.rawQuery('SELECT * FROM Dados');

    List<Dados> lista = [];
    for (var json in result) {
      Dados dados = Dados.fromJson(json);
      lista.add(dados);
    }
    return lista;
  }
}
