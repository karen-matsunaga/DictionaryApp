// CLASSE WORDS QUE SERÃO ARMAZENADOS OS DADOS NO ARQUIVO JSON

class Words {
  final String name, type, description, synonyms, python, cSharp, java, exit;
  final int id;

  Words(
    this.id,
    this.name,
    this.type,
    this.description,
    this.synonyms,
    this.python,
    this.cSharp,
    this.java,
    this.exit,
  );

  factory Words.fromJson(Map<String, dynamic> json) {
    return Words(
      json['id'],
      json['name'],
      json['type'],
      json['description'],
      json['synonyms'],
      json['python'],
      json['cSharp'],
      json['java'],
      json['exit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['description'] = this.description;
    data['synonyms'] = this.synonyms;
    data['python'] = this.python;
    data['cSharp'] = this.cSharp;
    data['java'] = this.java;
    data['exit'] = this.exit;
    return data;
  }
}
