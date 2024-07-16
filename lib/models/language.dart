import 'dart:convert';

// CONVERSÃO DO ARQUIVO JSON PARA DART
Language usersFromMap(String str) => Language.fromMap(json.decode(str));
String usersToMap(Language data) => json.encode(data.toMap());

// CLASSE TAGS QUE SERÃO ARMAZENADOS OS DADOS
// DAS CONSULTAS NO ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS
// PARA FACILITAR A PESQUISA DA PALAVRA
// COM O FUTURO SISTEMA DE TAGS

class Language {
  final int languageId;
  final String nameLanguage;

  Language({
    required this.languageId,
    required this.nameLanguage,
  });

  Map<String, dynamic> toMap() => {
        "languageId": languageId,
        "nameTag": nameLanguage,
      };

  factory Language.fromMap(Map<String, dynamic> json) => Language(
        languageId: json["languageId"],
        nameLanguage: json["nameLanguage"],
      );
}
