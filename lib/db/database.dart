import 'dart:io' show Directory;
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbname = "database.db";
  static const _version = 1;

  static const restaurant = 'restaurant';
  static const id = '_id';
  static const name = 'name';
  static const review = 'review';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbname);

    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $restaurant (
                $id INTEGER PRIMARY KEY,
                $name TEXT NOT NULL,
                $review TEXT NOT NULL
              )
              ''');
  }

  Future dbInsert(String table, Map<String, dynamic> data) async {
    await _database?.insert(table, data);
  }

  Future<List<Map<String, Object?>>?> listAllPerson() async {
    return await _database?.query(restaurant);
  }

  Future dbUpdate(String table, String id, Map<String, dynamic> data) async {
    await _database?.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  Future dbDelete(String table, String id, Map<String, dynamic> data) async {
    await _database?.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future dbClose() async {
    await _database?.close();
  }
}
