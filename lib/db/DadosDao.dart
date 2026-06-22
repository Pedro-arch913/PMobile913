import 'package:teste01/domain/dados.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste01/db/db_helper.dart';

class DadosDao {
  Future<List<Dados>> listarDados() async{
    Database db = await DBHelper().initDB();

    var result = await db.rawQuery('SELECT * FROM DADOS');

    List<Dados> lista = [];
    for (var json in result){
      Dados dados = Dados.fromJson(json);
      lista.add(dados);
    }
    return lista;
  }
}