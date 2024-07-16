import 'dart:convert';

// CONVERSÃO DO ARQUIVO JSON PARA DART
Tags usersFromMap(String str) => Tags.fromMap(json.decode(str));
String usersToMap(Tags data) => json.encode(data.toMap());

// CLASSE TAGS QUE SERÃO ARMAZENADOS OS DADOS
// DAS CONSULTAS NO ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS
// PARA FACILITAR A PESQUISA DA PALAVRA
// COM O FUTURO SISTEMA DE TAGS

class Tags {
  final int tagId;
  final String nameTag;

  Tags({
    required this.tagId,
    required this.nameTag,
  });

  Map<String, dynamic> toMap() => {
        "tagId": tagId,
        "nameTag": nameTag,
      };

  factory Tags.fromMap(Map<String, dynamic> json) => Tags(
        tagId: json["tagId"],
        nameTag: json["nameTag"],
      );
}
