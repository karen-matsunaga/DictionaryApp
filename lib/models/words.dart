// CLASSE WORDS QUE SERÃO ARMAZENADOS OS DADOS NO ARQUIVO JSON

class Words {
  final String? name, synonyms, description, example, exit;
  bool? favorite;

  Words(this.name, this.synonyms, this.description, this.example, this.exit,
      this.favorite);

  factory Words.fromJson(Map<String, dynamic> json) {
    return new Words(
      json['name'],
      json['description'],
      json['synonyms'],
      json['example'],
      json['exit'],
      json['favorite'],
    );
  }
}
