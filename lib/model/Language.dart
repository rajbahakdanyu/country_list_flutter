class Language {
  final String name;

  const Language({required this.name});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'] as String,
    );
  }

  factory Language.fromString(String string) {
    return Language(
      name: string,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
