import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'pets.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
      CREATE TABLE pets(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age TEXT,
        quantity TEXT,
        image TEXT,
        isInCart INTEGER DEFAULT 0
      )
      ''');
    });
  }

  Future<void> insertPet(Map<String, dynamic> pet) async {
    final db = await database;
    await db.insert('pets', pet);
  }

  Future<List<Map<String, dynamic>>> getPets() async {
    final db = await database;
    return await db.query('pets');
  }

  Future<void> updatePet(Map<String, dynamic> pet) async {
    final db = await database;
    await db.update(
      'pets',
      pet,
      where: 'id = ?',
      whereArgs: [pet['id']],
    );
  }

  Future<void> deletePet(int petId) async {
    final db = await database;
    await db.delete(
      'pets',
      where: 'id = ?',
      whereArgs: [petId],
    );
  }
}
