import 'package:aula_913/db/db_helper.dart';
import 'package:aula_913/domain/Historico.dart';
import 'package:sqflite/sqflite.dart';


class HistoricoDao {
  Future<void> listarHistorico() async {

    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM HISTORICO;');

    for(var json in listaResult){
      print(json);

      Historico(
        imagem: json['imagem'],
        servico: json['servico'],
        preco: json['preco'],
      )
    }

  }
}