import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import '../db/db_usuarios.dart';

class DBTareas {
  static Database? _db;
  static Future<Database> initDB() async {
    if (_db != null) return _db!;
    String path = join(await getDatabasesPath(), 'tareas.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tareas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            descripcion TEXT,
            completado INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
    );
    return _db!;
  }

  static Future<void> agregarTarea(String titulo, String descripcion) async {
    final db = await initDB();
    await db.insert('tareas', {
      'titulo': titulo,
      'descripcion': descripcion,
      'completado': 0,
    });
  }

  static Future<List<Map<String, dynamic>>> obtenerTareas() async {
    final db = await initDB();
    return await db.query('tareas');
  }

  static Future<void> eliminarTarea(int id) async {
    final db = await initDB();
    await db.delete('tareas', where: 'id = ?', whereArgs: [id]);
  }
}

class EjemploUsuarios extends StatefulWidget {
  const EjemploUsuarios({super.key});
  @override
  State<EjemploUsuarios> createState() => _EjemploUsuariosState();
}

class _EjemploUsuariosState extends State<EjemploUsuarios> {
  final _nombreCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  List<Map<String, dynamic>> _lista = [];

  void _cargarUsuarios() async {
    final datos = await DBUsuarios.obtenerUsuarios();
    setState(() => _lista = datos);
  }

  void _agregar() async {
    await DBUsuarios.agregarUsuario(_nombreCtrl.text, _emailCtrl.text);
    _nombreCtrl.clear();
    _emailCtrl.clear();
    _cargarUsuarios();
  }

  void _eliminar(int id) async {
    await DBUsuarios.eliminarUsuario(id);
    _cargarUsuarios();
  }

  @override
  void initState() {
    super.initState();
    _cargarUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Usuarios")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: _nombreCtrl,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                ElevatedButton(
                  onPressed: _agregar,
                  child: const Text("Agregar Usuario"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder:
                  (_, i) => ListTile(
                    title: Text(_lista[i]['nombre']),
                    subtitle: Text(_lista[i]['email']),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _eliminar(_lista[i]['id']),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
