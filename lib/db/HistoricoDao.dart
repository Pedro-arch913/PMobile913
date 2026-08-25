import 'package:pmobile913/db/db_helper.dart';
import 'package:pmobile913/domain/historico.dart';
import 'package:sqflite/sqflite.dart';

class HistoricoDao {
  Future<List<Historico>> listarHistorico() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM HISTORICO;');

    List<Historico> lista = [];
    for (var json in listaResult) {
      Historico historico = Historico.fromJson(json);
      lista.add(historico);
    }
    return lista;
  }
}
