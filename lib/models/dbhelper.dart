import 'dart:async';
// import 'package:dictionary/models/codes.dart';
import 'package:dictionary/models/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// BANCO DE DADOS SQFLITE
class DatabaseHelper {
  // DatabaseHelper._privateConstructor();
  // static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // static Database? _database;

  // INICIAR BANCO DE DADOS
  // Future<Database> get database async {
  //   if (_database != null) return _database!;
  //   _database = await initDatabase();
  //   return _database!;
  // }

  // INICIAR BANCO DE DADOS
  initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
      // db.execute(favorites);
      // db.execute(tags);
      // db.execute(codes);
      // db.execute(language);
    });
  }

  // FECHAR O BANCO DE DADOS AUTOMATICAMENTE

  // NOME DO BANCO DE DADOS
  final databaseName = "users.db";

  // CRIAÇÃO DAS TABELAS NO USERS.DB

  // TABELA users que é responsável pela autenticação do usuário
  String users =
      "create table users (userId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, userName TEXT, email TEXT, userPassword TEXT)";

  // , idFavorite INTEGER PRIMARY KEY AUTOINCREMENT, FOREIGN KEY (idFavorite) REFERENCES favorites(favoriteId));

  // TABELA favorites para os favoritos de cada usuário
  // String favorites =
  //     "create table favorites (favoriteId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, idCode INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, idUser INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, FOREIGN KEY (idCode) REFERENCES code(codeId), FOREIGN KEY (idUser) REFERENCES users(userId))";

  // TABELA tags para o sistema de tags como sugestões de palavras para consultas
  // String tags =
  //     "create table tags (tagId INTEGER PRIMARY KEY AUTOINCREMENT, nameTag TEXT UNIQUE)";

  // TABELA code para o código da linguagem em Python, C#, JAVA e Saída de Dados
  // String codes =
  //     "create table codes (codeId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, idLanguage INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, idTag INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, name TEXT, synonyms INTEGER PRIMARY KEY, description TEXT, example TEXT, exit TEXT, FOREIGN KEY (idLanguage) REFERENCES language(languageId), FOREIGN KEY (idTag) REFERENCES tags(tagId))";

  // TABELA language para a linguagem de programação dos códigos exibidos
  // String language =
  //     "create table language (languageId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, nameLanguage TEXT)";

  // BANCO DE DADOS - VERIFICAR CONTA
  Future<bool> authenticate(Users user) async {
    final Database db = await initDatabase();

    var result = await db.rawQuery(
      "select * from users where email = '${user.email}' AND userPassword = '${user.userPassword}'",
    );
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // BANCO DE DADOS - CRIAR CONTA
  Future<int> createUser(Users user) async {
    final Database db = await initDatabase();

    return db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // BANCO DE DADOS - LEITURA DOS DADOS DO USUÁRIO PELO ID
  Future<Users?> getUser(int id) async {
    final db = await initDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'userId = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    } else {
      return null;
    }
  }

  // BANCO DE DADOS - USUÁRIO DUPLICADO PELO E-MAIL DIGITADO
  Future<bool> checkUserDuplicated(String email) async {
    final db = await initDatabase();
    final List<Map<String, dynamic>> res =
        await db.query('users', where: 'email = ?', whereArgs: [email]);
    return res.isNotEmpty;
  }

  // BANCO DE DADOS - PESQUISA DAS PALAVRAS

  // BANCO DE DADOS - SISTEMA DE TAGS PARA SUGESTÃO DE PESQUISA

  // BANCO DE DADOS - RETORNO DAS PALAVRAS

  // Future<List<Codes?>> getCode(int idLanguage, String example) async {
  //   final Database db = await initDatabase();
  //   final List<Map<String, Object?>> queryResult = await db.query(
  //       'SELECT * FROM codes',
  //       where: 'idLanguage = ? AND example = ?',
  //       whereArgs: [idLanguage, example]);
  //   return queryResult.map((e) => Codes.fromMap(e)).toList();
  // }

  // BANCO DE DADOS - LISTAGEM DAS PALAVRAS DOS FAVORITOS
  // Future<List<Favorites?>> getWords() async {
  //   final Database db = await initDatabase();
  //   final List<Map<String, Object?>> queryResult =
  //       await db.rawQuery('SELECT * FROM favorites');
  //   return queryResult.map((e) => Favorites.fromMap(e)).toList();
  // }

  // FECHAMENTO DO BANCO DE DADOS
}
