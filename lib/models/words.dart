// CLASSE WORDS QUE SERÃO ARMAZENADOS OS DADOS
// DAS PALAVRAS CADASTRADOS EM ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS

class Words {
  final int wordId;
  final String name;
  final String synonyms;
  final String language;
  final String description;

  Words({
    required this.wordId,
    required this.name,
    required this.synonyms,
    required this.language,
    required this.description,
  });

  factory Words.fromMap(Map<String, dynamic> json) => Words(
        wordId: json["wordId"],
        name: json["name"],
        synonyms: json["synonyms"],
        language: json["language"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "wordId": wordId,
        "name": name,
        "synonyms": synonyms,
        "language": language,
        "description": description,
      };
}
