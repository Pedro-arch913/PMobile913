import 'package:pmobile913/db/db_helper.dart';
import 'package:pmobile913/domain/historico.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class HistoricoDao {
  Future<List<Historico>> listarHistorico() async {
    Database db = await DBHelper().initDB();

    var result = await db.rawQuery('SELECT * FROM HISTORICO;');

    List<Historico> lista = [];
    for (var json in result) {
      Historico historico = Historico.fromJson(json);
      lista.add(historico);
    }
    await Future.delayed(Duration(seconds: 2));
    return lista;
  }
}
