import 'package:pmobile913/domain/services.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
class ServiceDAO{
  Future <List<Services>> listarService() async{
    Database db = await DbHelper().initDB();

    var result = await db.rawQuery("SELECT * FROM services");

    List<Services> lista = [];
    for (var json in result){
      Services serv = Services.fromJson(json);
      lista.add(serv);
    }
    return lista;
  }
}