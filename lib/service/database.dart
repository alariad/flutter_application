import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'User.dart';

class DB {
  static Database _db;
  static const String ID = 'id';
  static const String USERNAME = 'username';
  static const String EMAIL = 'email';
  static const String PASSWORD = 'password';
  static const String TABLE = 'User';
  static const String DB_NAME = 'user1.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB(); //Executed only once
    return _db;
  }

  initDB() async {
    // Get the directory path for both Android and iOS to store database
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    //open the database at a given path
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  //create the database at a given path
  _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $USERNAME TEXT, $EMAIL TEXT, $PASSWORD TEXT)");
  }

  // Insert Operation: Insert User object to database
  Future<User> save(User user) async {
    var dbClient = await db; //instance
    user.id = await dbClient.insert(TABLE, user.toMap());
    return user;
  }

  //Fetch Operation: Get all User objects from database
  Future<List<User>> getUsers() async {
    var dbClient = await db; //instance
    List<Map> maps = await dbClient.query(TABLE, columns: [ID.toString(), USERNAME,EMAIL,PASSWORD]);
    List<User> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(User.fromMap(maps[i]));
      }
    }
    return employees;
  }

  // close Operation
  Future close() async {
    var dbClient = await db; //instance
    dbClient.close();
  }
}