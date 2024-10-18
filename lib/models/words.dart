// CLASSE WORDS QUE SERÃO ARMAZENADOS OS DADOS NO ARQUIVO JSON

class Words {
  final String name,
      type,
      description,
      synonyms,
      portugol,
      python,
      cSharp,
      java,
      exit;
  final int wordId;

  Words(this.wordId, this.name, this.type, this.description, this.synonyms,
      this.portugol, this.python, this.cSharp, this.java, this.exit);

  factory Words.fromJson(Map<String, dynamic> json) {
    return Words(
      json['wordId'] ?? 0,
      json['name'] ?? '',
      json['type'] ?? '',
      json['description'] ?? '',
      json['synonyms'] ?? '',
      json['portugol'] ?? '',
      json['python'] ?? '',
      json['cSharp'] ?? '',
      json['java'] ?? '',
      json['exit'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wordId'] = this.wordId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['description'] = this.description;
    data['synonyms'] = this.synonyms;
    data['portugol'] = this.portugol;
    data['python'] = this.python;
    data['cSharp'] = this.cSharp;
    data['java'] = this.java;
    data['exit'] = this.exit;
    return data;
  }
}
