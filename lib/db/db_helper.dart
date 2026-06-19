import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  Future<Database> initDB() async {

    String path = await getDatabasesPath();
    String dbName = 'Historico.db';
    String dbPath = join(path, dbName);
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }
  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = '''CREATE TABLE HISTORICO (
      id          INTEGER PRIMARY KEY AUTOINCREMENT,
      imagem      TEXT,
      servico     TEXT,
      preco       TEXT
       
       );''';

    await db.execute(sql);
    sql =
        "INSERT INTO HISTORICO (imagem, servico, preco) VALUES ('https://static.vecteezy.com/ti/vetor-gratis/p1/60211026-a-pintor-e-pintura-a-parede-vetor.jpg', 'Pintura', \$2250.00)";
    await db.execute(sql);
    sql =
        "INSERT INTO HISTORICO (imagem, servico, preco) VALUES ('https://static.vecteezy.com/ti/vetor-gratis/p1/60211026-a-pintor-e-pintura-a-parede-vetor.jpg', 'Pintura', \$2250.00)";
    await db.execute(sql);
    sql =
         "INSERT INTO HISTORICO (imagem, servico, preco) VALUES ('https://static.wixstatic.com/media/04008f_f9c24736e79341549c930d6937574068~mv2.jpg/v1/fill/w_568,h_378,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/04008f_f9c24736e79341549c930d6937574068~mv2.jpg', 'Pintura', \$2250.00)";
    await db.execute(sql);
  }
}
