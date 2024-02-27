import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelperMap  {
  static int flag = 0;
  static sql.Database? _database;
  Future<sql.Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await db();
    return _database;
  }

  FutureOr<sql.Database> db() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = '${dir.path}/Nipimap.sqlite';
    return await sql.openDatabase(path, version: 1, onCreate: (sql.Database database, int version) async {
      await database.execute("""CREATE TABLE poligons(
        id TEXT NOT NULL,
        type TEXT NOT NULL,
        coordinates TEXT NOT NULL,
        color TEXT NOT NULL,
        datetime TEXT NOT NULL
      )
      """);

      await database.insert('poligons',
          {'id':'1', 'type':'Circle','coordinates':'56.3, 84.4', 'color': 'Green', 'datetime': '1969-07-20 20:18:04Z'},
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
    });
  }

  Future<void> createItemPoligon(String id, String type, String coordinates, String color, String datetime) async {
    final data = {'id': id, 'type':type, 'coordinates': coordinates, 'color': color, 'datetime': datetime};
    final sql.Database? db = await database;
    await db!.insert('poligons', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  Future<String> getPolygonItemsAsString() async {
    final sql.Database? db = await database;

    String stringHelper = '${await db?.rawQuery('SELECT id, type, coordinates, color, datetime FROM poligons')}';
    late String string = ' ';
    for( int i = 0; i < stringHelper.length; i++){
      if (stringHelper[i] == '}') {
        string += '\n\n';
      }
      else if (stringHelper[i] == '{' || stringHelper[i] == ',' || stringHelper[i] == '[' || stringHelper[i] == ']') {
        continue;
      }
      else {
        string = string + stringHelper[i];
      }
    }
    return string;
  }
}