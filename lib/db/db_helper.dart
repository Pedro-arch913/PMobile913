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
        "INSERT INTO MENSAGEM (contato_id, texto, send_by_me) VALUES ('1', 'oi', 'no')";
    await db.execute(sql);
  }
  FutureOr<void> onCreatedb(Database gardeldb, int version) async {
    String sql = '''CREATE TABLE services(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      description TEXT,
      image TEXT);
    ''';
    await gardeldb.execute(sql);

    sql =
    "INSERT INTO services (name, description, image) VALUES ('Complete Kitchen Renovation', 'Complete kitchen remodeling including tiles, cabinets, sinks, faucets, painting and finishes.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRshZcj2KS6c8Yt1A3TKqVpVa0a-NDY21-Mzr9VFkAYwUA9SUweUeuLbUPG&s=10');";
    await gardeldb.execute(sql);
    sql =
    "INSERT INTO services (name, description, image) VALUES ('Construction of Leisure Area', 'Construction of patio, deck or grill area with structure, roofing and finishes.', 'https://sodramar.com.br/wp-content/uploads/2020/11/211.jpg');";
    await gardeldb.execute(sql);
    sql =
    "INSERT INTO services (name, description, image) VALUES ('Installation of Central Air Conditioning System', 'Complete central air conditioning installation with piping, electrical wiring and testing.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRmoVUeCJ-qTgqQk5sspwaZmW65ounvlG4JCIIKJGrlKB5AIzaDbIxK8g&s=10');";
    await gardeldb.execute(sql);
    sql =
    "INSERT INTO services (name, description, image) VALUES ('Landscape and Drainage Construction', 'Complete landscape design and execution, automatic irrigation system and drainage system.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrvq6IzK6Ru2DsUTsHpJOyLJeSywSf3BCaogn82-_low0y94NNHExmcUcK&s=10');";
    await gardeldb.execute(sql);
  }
}