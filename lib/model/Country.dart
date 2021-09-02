import 'package:sqflite_test/model/Language.dart';

class Country {
  final String name;
  final String capital;
  final String flag;
  final List<Language> language;

  Country({
    required this.name,
    required this.capital,
    required this.flag,
    required this.language,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    var languages = new List<Language>.empty(growable: true);
    if (json['languages'] != null) {
      if (json['languages'].runtimeType == String) {
        var list = json['languages'].toString().split(',');
        list.forEach((lang) {
          var name = lang.split(':')[1];
          languages.add(new Language.fromString(name));
        });
      } else {
        json['languages'].forEach((v) {
          languages.add(new Language.fromJson(v));
        });
      }
    }

    return Country(
      name: json['name'] as String,
      capital: json['capital'] as String,
      flag: json['flagPNG'] as String,
      language: languages,
    );
  }

  factory Country.fromString(Map<String, dynamic> json) {
    var languages = new List<Language>.empty(growable: true);
    if (json['languages'] != null) {
      var list = json['languages'].toString().split(',');
      print(list);
      list.forEach((lang) {
        var name = lang.split(':')[1];
        languages.add(new Language.fromString(name));
      });
    }

    return Country(
      name: json['name'] as String,
      capital: json['capital'] as String,
      flag: json['flagPNG'] as String,
      language: languages,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    var lang = this.language.map((v) => v.toJson()).toString();
    data['capital'] = this.capital;
    data['flagPNG'] = this.flag;
    data['name'] = this.name;
    data['languages'] = lang;

    return data;
  }
}
