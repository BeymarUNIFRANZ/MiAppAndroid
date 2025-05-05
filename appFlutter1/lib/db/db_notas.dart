import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBNotas {
  static Database? _db;

  static Future<Database> initDB() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), 'notas.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE notas (
id INTEGER PRIMARY KEY AUTOINCREMENT,
titulo TEXT NOT NULL,
contenido TEXT NOT NULL
)
''');
      },
    );
    return _db!;
  }

  static Future<void> agregarNota(String titulo, String contenido) async {
    final db = await initDB();
    await db.insert('notas', {'titulo': titulo, 'contenido': contenido});
  }

  static Future<List<Map<String, dynamic>>> obtenerNotas() async {
    final db = await initDB();
    return await db.query('notas');
  }

  static Future<void> eliminarNota(int id) async {
    final db = await initDB();
    await db.delete('notas', where: 'id = ?', whereArgs: [id]);
  }
}
