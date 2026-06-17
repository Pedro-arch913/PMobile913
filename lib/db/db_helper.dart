import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  initDB() async {

    String path = await getDatabasesPath();
    String dbName = 'Historico.db';

    String dbPath = join(path, dbName);

    Database db = await openDatabase(dbPath, onCreate: onCreateDB);

    return db;


  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = '''CREATE TABLE HISTORICO (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      imagem TEXT,
      servico TEXT,
      preco REAL NOT NULL
       
       );''';

    await db.execute(sql);

    sql =
        "INSERT INTO Historico (imagem, servico, preco) VALUES ('https://static.vecteezy.com/ti/vetor-gratis/p1/60211026-a-pintor-e-pintura-a-parede-vetor.jpg', 'Pintura', 2250.00)";

  }

}
