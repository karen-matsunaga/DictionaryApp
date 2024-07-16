import 'dart:convert';

// CLASSE FAVORITES QUE SERÃO ARMAZENADOS OS DADOS
// DAS PALAVRAS CADASTRADAS NO ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS E
// SALVAR OS FAVORITOS DE CADA USUÁRIO

Favorites usersFromMap(String str) => Favorites.fromMap(json.decode(str));
String usersToMap(Favorites data) => json.encode(data.toMap());

class Favorites {
  final int favoriteId;
  final int idCode;
  final int idUser;

  Favorites({
    required this.favoriteId,
    required this.idCode,
    required this.idUser,
  });

  factory Favorites.fromMap(Map<String, dynamic> json) => Favorites(
        favoriteId: json["favoriteId"],
        idCode: json["idCode"],
        idUser: json["idUser"],
      );

  Map<String, dynamic> toMap() => {
        "favoriteId": favoriteId,
        "idCode": idCode,
        "idUser": idUser,
      };
}
