import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'chat.db';

    String dbpath = join(path, dbName);

    Database db = await openDatabase(dbpath, version: 1, onCreate: onCreateDB);

    return db;
  }

  Future<void> onCreateDB(Database db, int version) async {
    String sql = '''CREATE TABLE CONTATO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        info TEXT,
        time TEXT,
        foto TEXT
    );''';

    await db.execute(sql);

    sql =
    "INSERT INTO CONTATO (nome, info, time, foto) VALUES ('Empresa 1', 'company info 1', '09:45', 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png');";
    await db.execute(sql);
    sql =
    "INSERT INTO CONTATO (nome, info, time, foto) VALUES ('Empresa 2', 'company info 2', '10:30', 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png');";
    await db.execute(sql);
    sql =
    "INSERT INTO CONTATO (nome, info, time, foto) VALUES ('Empresa 3', 'company info 3', '11:00', 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png');";
    await db.execute(sql);
    sql =
    "INSERT INTO CONTATO (nome, info, time, foto) VALUES ('Empresa 4', 'company info 4', '09:45', 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png');";
    await db.execute(sql);
    sql =
    "INSERT INTO CONTATO (nome, info, time, foto) VALUES ('Empresa 5', 'company info 5', '10:30', 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png');";
    await db.execute(sql);
    sql =
    "INSERT INTO CONTATO (nome, info, time, foto) VALUES ('Empresa 6', 'company info 6', '11:00', 'https://cdn-icons-png.flaticon.com/512/5987/5987462.png');";
    await db.execute(sql);

    sql = '''CREATE TABLE MENSAGEM (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        contato_id INTEGER,
        texto TEXT,
        send_by_me TEXT  
    );''';

    await db.execute(sql);

    sql =
        "INSERT INTO MENSAGEM (contato_id, texto, send_by_me) VALUES ('1', 'oi')"
  }
}