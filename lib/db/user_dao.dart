import 'package:aula_913/db/db_helper.dart';
import 'package:aula_913/domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  Future<bool> login(String username,String password) async{
    Database db = await DBHelper().initDB();
    String sql =
    '''SELECT * FROM USER WHERE username = ? AND password = ?;''';

    var result = await db.rawQuery(sql,[username, password]);
    return result.isNotEmpty;
  }

  saveUser(User)
}