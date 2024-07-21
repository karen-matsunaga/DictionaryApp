import 'dart:async';
// import 'dart:js_interop';
import 'package:dictionary/models/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// BANCO DE DADOS SQFLITE
class DatabaseHelper {
  // INICIAR BANCO DE DADOS
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  // INICIAR BANCO DE DADOS
  initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      // ATIVAÇÃO DA FOREIGN KEY DA TABELA USERS
      await db.execute('PRAGMA foreign_keys = ON');
      // EXECUÇÃO DAS TABELAS USUÁRIOS, FAVORITOS, ETIQUETAS, CÓDIGOS E LINGUAGEM
      await db.execute(users);
      await db.execute(favorites);
      await db.execute(tags);
      await db.execute(language);
      await db.execute(codes);
      // FECHAMENTO DO BANCO DE DADOS
      await db.close();

      // REMOÇÃO DO BANCO DE DADOS
      // await deleteDatabase(databaseName);
      // await deleteDatabase(path);
    });
  }

  // NOME DO BANCO DE DADOS
  final databaseName = "users.db";

  // CRIAÇÃO DAS TABELAS users, favorites, tags, codes e language NO USERS.DB

  // TABELA users que é responsável pela autenticação do usuário
  String users =
      // "create table users (userId INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, userName TEXT, email TEXT, userPassword TEXT)";

      "create table users (userId INTEGER PRIMARY KEY AUTOINCREMENT, idFavorite INTEGER, userName TEXT, email TEXT, userPassword TEXT, FOREIGN KEY (idFavorite) REFERENCES favorites(favoriteId))";

  // TABELA favorites para os favoritos de cada usuário
  String favorites =
      "create table favorites (favoriteId INTEGER PRIMARY KEY AUTOINCREMENT, idCode INTEGER, idUser INTEGER, FOREIGN KEY (idCode) REFERENCES codes(codeId), FOREIGN KEY (idUser) REFERENCES users(userId))";

  // TABELA tags para o sistema de tags como sugestões de palavras para consultas
  String tags =
      "create table tags (tagId INTEGER PRIMARY KEY AUTOINCREMENT, nameTag TEXT)";

  // TABELA language para a linguagem de programação dos códigos exibidos
  String language =
      "create table language (languageId INTEGER PRIMARY KEY AUTOINCREMENT, nameLanguage TEXT)";

  // TABELA code para o código da linguagem em Python, C#, JAVA e Saída de Dados
  String codes =
      "create table codes (codeId INTEGER PRIMARY KEY AUTOINCREMENT, idLanguage INTEGER, idTag INTEGER, name TEXT, synonyms INTEGER, description TEXT, example TEXT, exit TEXT, FOREIGN KEY (idLanguage) REFERENCES language(languageId), FOREIGN KEY (idTag) REFERENCES tags(tagId))";

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
  Future<bool> checkUserDuplicated(String email, String userName) async {
    final db = await initDatabase();
    final List<Map<String, dynamic>> res = await db.query('users',
        where: 'email = ? AND userName = ?', whereArgs: [email, userName]);
    return res.isNotEmpty;
  }

  // BANCO DE DADOS - PESQUISA DAS PALAVRAS

  // BANCO DE DADOS - RETORNO DAS PALAVRAS

  // BANCO DE DADOS - LISTAGEM DAS PALAVRAS DOS FAVORITOS
}
