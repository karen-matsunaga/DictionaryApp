// CLASSE CODES QUE SERÃO ARMAZENADOS OS DADOS NO ARQUIVO JSON

class Codes {
  final String name;
  final String synonyms;
  final String description;
  final String example;
  final String exit;
  bool favorite;

  Codes(this.name, this.synonyms, this.description, this.example, this.exit,
      this.favorite);

  factory Codes.fromJson(Map<String, dynamic> json) {
    return new Codes(
      json['name'],
      json['synonyms'],
      json['description'],
      json['example'],
      json['exit'],
      json['favorite'],
    );
  }
}
