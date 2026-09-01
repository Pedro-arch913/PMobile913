import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'projeto.db';
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
    "INSERT INTO HISTORICO (imagem, servico, preco) VALUES ('https://static.vecteezy.com/ti/vetor-gratis/p1/60211026-a-pintor-e-pintura-a-parede-vetor.jpg', 'Pintura', 'R\$ 2250,00');";
    await db.execute(sql);
    sql =
    "INSERT INTO HISTORICO (imagem, servico, preco) VALUES ('https://static.vecteezy.com/ti/vetor-gratis/p1/60211026-a-pintor-e-pintura-a-parede-vetor.jpg', 'Pintura', 'R\$ 2250,00');";
    await db.execute(sql);
    sql =
    "INSERT INTO HISTORICO (imagem, servico, preco) VALUES ('https://static.wixstatic.com/media/04008f_f9c24736e79341549c930d6937574068~mv2.jpg/v1/fill/w_568,h_378,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/04008f_f9c24736e79341549c930d6937574068~mv2.jpg', 'Pintura', 'R\$ 2250,00');";
    await db.execute(sql);


    sql = '''CREATE TABLE Dados(
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


    sql = '''CREATE TABLE services(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      description TEXT,
      image TEXT);
    ''';
    await db.execute(sql);

    sql =
    "INSERT INTO services (name, description, image) VALUES ('Complete Kitchen Renovation', 'Complete kitchen remodeling including tiles, cabinets, sinks, faucets, painting and finishes.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRshZcj2KS6c8Yt1A3TKqVpVa0a-NDY21-Mzr9VFkAYwUA9SUweUeuLbUPG&s=10');";
    await db.execute(sql);
    sql =
    "INSERT INTO services (name, description, image) VALUES ('Construction of Leisure Area', 'Construction of patio, deck or grill area with structure, roofing and finishes.', 'https://sodramar.com.br/wp-content/uploads/2020/11/211.jpg');";
    await db.execute(sql);
    sql =
    "INSERT INTO services (name, description, image) VALUES ('Installation of Central Air Conditioning System', 'Complete central air conditioning installation with piping, electrical wiring and testing.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRmoVUeCJ-qTgqQk5sspwaZmW65ounvlG4JCIIKJGrlKB5AIzaDbIxK8g&s=10');";
    await db.execute(sql);
    sql =
    "INSERT INTO services (name, description, image) VALUES ('Landscape and Drainage Construction', 'Complete landscape design and execution, automatic irrigation system and drainage system.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrvq6IzK6Ru2DsUTsHpJOyLJeSywSf3BCaogn82-_low0y94NNHExmcUcK&s=10');";
    await db.execute(sql);


    sql = '''CREATE TABLE CONTATO (
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
    "INSERT INTO MENSAGEM (contato_id, texto, send_by_me) VALUES (1, 'oi', '1');";
    await db.execute(sql);
  }
}