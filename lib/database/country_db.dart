import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_test/model/Country.dart';

class CountryDB {
  static final CountryDB instance = CountryDB._init();

  static Database? _database;

  CountryDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('countries.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int verison) async {
    final String query = '''
    CREATE TABLE countries (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      capital TEXT NOT NULL,
      flagPNG TEXT NOT NULL,
      languages TEXT NOT NULL
    )
    ''';

    await db.execute(query);
  }

  Future create(Country country) async {
    final db = await instance.database;

    await db.insert('countries', country.toJson());
  }

  Future<List<Country>> readAll() async {
    final db = await instance.database;

    final result = await db.query('countries');

    var country_list = [];

    result.forEach((json) {
      country_list.add(json);
    });

    print(country_list);

    return result.map((json) => Country.fromString(json)).toList();
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
