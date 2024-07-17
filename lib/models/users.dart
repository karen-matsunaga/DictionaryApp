import 'dart:convert';

// CONVERSÃO DO ARQUIVO JSON PARA DART
Users usersFromMap(String str) => Users.fromMap(json.decode(str));
String usersToMap(Users data) => json.encode(data.toMap());

// CLASSE USERS QUE SERÃO ARMAZENADOS OS DADOS
// DOS USUÁRIOS CADASTRADOS EM ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS

class Users {
  final int? userId, idFavorite;
  final String? userName, email, userPassword;

  Users({
    this.userId,
    this.idFavorite,
    this.userName,
    this.email,
    this.userPassword,
  });

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "idFavorite": idFavorite,
        "userName": userName,
        "email": email,
        "userPassword": userPassword,
      };

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        idFavorite: json["idFavorite"],
        userName: json["userName"],
        email: json["email"],
        userPassword: json["userPassword"],
      );
}
