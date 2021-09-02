import 'Language.dart';

class Country {
  late String capital;
  late String flag;
  late List<Languages> languages;
  late String name;

  Country({
    required this.capital,
    required this.flag,
    required this.languages,
    required this.name,
  });

  Country.fromJson(Map<String, dynamic> json) {
    capital = json['capital'];
    flag = json['flagPNG'];
    languages = [];
    if (json['languages'].runtimeType == String) {
      String lang = json['languages'];
      lang = lang.replaceAll("(", "");
      lang = lang.replaceAll(")", "");
      lang = lang.replaceAll("{", "");
      lang = lang.replaceAll("}", "");
      List<String> tempList = lang.split(",");
      tempList.forEach((element) {
        languages.add(Languages(name: element.trim().replaceAll("name: ", "")));
      });
    } else {
      json['languages'].forEach((v) {
        languages.add(Languages.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['capital'] = this.capital;
    data['flagPNG'] = this.flag;
    data['languages'] = this.languages.map((v) => v.toJson()).toList();
    data['name'] = this.name;
    return data;
  }
}
