import 'dart:convert';

// CLASSE CODE QUE SERÃO ARMAZENADOS OS DADOS
// DAS PALAVRAS CADASTRADAS NO ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS

Codes usersFromMap(String str) => Codes.fromMap(json.decode(str));
String usersToMap(Codes data) => json.encode(data.toMap());

class Codes {
  final int codeId;
  final int idLanguage;
  final int idTag;
  final String name;
  final int synonyms;
  final String description;
  final String example;
  final String exit;

  Codes({
    required this.codeId,
    required this.idLanguage,
    required this.idTag,
    required this.name,
    required this.synonyms,
    required this.description,
    required this.example,
    required this.exit,
  });

  factory Codes.fromMap(Map<String, dynamic> json) => Codes(
        codeId: json["codeId"],
        idLanguage: json["idLanguage"],
        idTag: json["idTag"],
        name: json["name"],
        synonyms: json["synonyms"],
        description: json["description"],
        example: json["example"],
        exit: json["exit"],
      );

  Map<String, dynamic> toMap() => {
        "codeId": codeId,
        "idLanguage": idLanguage,
        "idTag": idTag,
        "name": name,
        "synonyms": synonyms,
        "description": description,
        "example": example,
        "exit": exit,
      };
}
