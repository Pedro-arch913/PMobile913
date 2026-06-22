import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  Future<Database> initDB() async{
    String path = await getDatabasesPath();
    String dbname = 'profprox.db';

    String dbPath = join(path, dbname);
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);
    return db;
  }

  Future<void> onCreateDB(Database db, int version) async{
    String sql = '''CREATE TABLE Dados(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    avaliacao REAL,
    informacoes TEXT,
    urlimagem TEXT,
    nome TEXT
    );''';
    await db.execute(sql);
    sql =
        "INSERT INTO Dados (avaliacao, informacoes, urlimagem, nome) VALUES (4.98, 'Encanador e eletricista', 'https://st3.depositphotos.com/1662991/17073/i/1600/depositphotos_170731092-stock-photo-handsome-plumber-doing-some-work.jpg', 'Marcos');";
    await db.execute(sql);

    sql =
        "INSERT INTO Dados (avaliacao, informacoes, urlimagem, nome) VALUES (4.21, 'Pedreiro, eletricista e soldador', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcvTXsuZM_PSxa3fWM9t3RTZJbPFlzyCYEeUAhIJvDusw9mN7baMwq2mg&s=10', 'Jonas');";
    await db.execute(sql);

    sql =
        "INSERT INTO Dados (avaliacao, informacoes, urlimagem, nome) VALUES (4.73, 'Pintor e eletricista', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4tIlpcFO_vxVLsuSd7PHON5F3WIcs8BbHy71WK3JC0uXUT_caIzYEEZRK&s=10', 'Carlos');";
    await db.execute(sql);

    sql =
        "INSERT INTO Dados (avaliacao, informacoes, urlimagem, nome) VALUES (4.34, 'Detetizadora', 'https://www.zet-tecdedetizadora.com.br/wp-content/uploads/2026/04/ChatGPT-Image-2_04_2026-08_25_54-1-1024x683.png', 'Flávia');";
    await db.execute(sql);

    sql =
        "INSERT INTO Dados (avaliacao, informacoes, urlimagem, nome) VALUES (4.93, 'Soldador e eletricista', 'https://inspesolda.com/wp-content/uploads/2025/01/o-que-define-um-soldador-qualificado-1.webp', 'Pedro');";
    await db.execute(sql);
  }
}