import 'package:aula_913/db/db_helper.dart';
import 'package:aula_913/domain/Historico.dart';
import 'package:sqflite/sqflite.dart';


class HistoricoDao {

  Future<List<Historico>> listarHistorico() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM HISTORICO;');

    List<Historico> lista = [];
    for(var json in listaResult){
      print(json);
        //imagem: json['imagem'],
        //servico: json['servico'],
        //preco: json['preco'],);

      Historico historico = Historico.fromJson(json);
      lista.add(historico);
    }
    return lista;
  }
}