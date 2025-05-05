import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBUsuarios {
  static Database? _db;

  static Future<Database> initDB() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), 'usuarios.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE usuarios (
id INTEGER PRIMARY KEY AUTOINCREMENT,
nombre TEXT NOT NULL,
email TEXT NOT NULL
)
''');
      },
    );
    return _db!;
  }

  static Future<void> agregarUsuario(String nombre, String email) async {
    final db = await initDB();
    await db.insert('usuarios', {'nombre': nombre, 'email': email});
  }

  static Future<List<Map<String, dynamic>>> obtenerUsuarios() async {
    final db = await initDB();
    return await db.query('usuarios');
  }

  static Future<void> eliminarUsuario(int id) async {
    final db = await initDB();
    await db.delete('usuarios', where: 'id = ?', whereArgs: [id]);
  }
}
