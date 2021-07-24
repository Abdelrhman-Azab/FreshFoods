import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static late Database database;

  openDb() async {
    database = await openDatabase(
      "cart.db",
      version: 1,
      onCreate: (db, version) {
        db.execute('CREATE TABLE Cart (id INTEGER PRIMARY KEY, )');
      },
    );
  }
}
