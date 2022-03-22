import 'dart:io';
import 'package:api_task/models/news_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  // static late Database _database;
  String databaseName = 'Faves.db';
  String favorites = 'Favorites';

  Future<Database> get database async {

    Database _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, databaseName);
    var _db = await openDatabase(path, version: 1,
        onCreate: onCreate );
    return _db;
  }

  onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $favorites ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        "summary TEXT,"
        "published TEXT"
        ")");
    print("table created");
  }
  getFavorites(int id) async{
    final db = await database;
    var res = await db.query(favorites, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Datum.fromMap(res.first) : Null;
  }
  Future<List<Datum>>getAllFavorites()async{
    final db = await database;
    var res = await db.query(favorites);
    List<Datum> list = res.isNotEmpty ? res.map((e) => Datum.fromMap(e)).toList() : [];
    return list;
  }
  newFavorites(Datum newFavorites)async{
    final db = await database;
    var res = await db.insert(favorites, newFavorites.toMap());
    return res;


  }
  deleteFavorites(int id)async{
    var db = await database;
    db.delete(favorites, where: "id = ?", whereArgs: [id]);
  }

  deleteAll()async{
    final db = await database;
    db.rawDelete("DELETE FROM $favorites");
  }
}