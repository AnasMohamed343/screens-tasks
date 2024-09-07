import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static final _databaseName = 'users.db';
  static final _tableName = 'users';

  static Future<Database> _getDatabase() async {
    //databaseFactory = databaseFactoryFfi;
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY,
            firstName TEXT,
            lastName TEXT,
            email TEXT,
            password TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  static Future<void> insertUser(User user) async {
    final db = await _getDatabase();
    await db.insert(_tableName, user.toMap());
  }

  static Future<List<User>> getUsers() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        firstName: maps[i]['firstName'],
        lastName: maps[i]['lastName'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  User({this.id, this.firstName, this.lastName, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}
