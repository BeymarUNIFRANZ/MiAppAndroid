import 'package:flutter/material.dart';
import '../db/db_tareas.dart';

class EjemploTareas extends StatefulWidget {
  const EjemploTareas({super.key});
  @override
  State<EjemploTareas> createState() => _EjemploTareasState();
}

class _EjemploTareasState extends State<EjemploTareas> {
  final _tituloCtrl = TextEditingController();
  final _descripcionCtrl = TextEditingController();
  List<Map<String, dynamic>> _lista = [];
  void _cargarTareas() async {
    final datos = await DBTareas.obtenerTareas();
    setState(() => _lista = datos);
  }

  void _agregar() async {
    await DBTareas.agregarTarea(_tituloCtrl.text, _descripcionCtrl.text);
    _tituloCtrl.clear();
    _descripcionCtrl.clear();
    _cargarTareas();
  }

  void _eliminar(int id) async {
    await DBTareas.eliminarTarea(id);
    _cargarTareas();
  }

  @override
  void initState() {
    super.initState();
    _cargarTareas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tareas")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: _tituloCtrl,
                  decoration: const InputDecoration(labelText: 'Título'),
                ),
                TextField(
                  controller: _descripcionCtrl,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                ),
                ElevatedButton(
                  onPressed: _agregar,
                  child: const Text("Agregar Tarea"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder:
                  (_, i) => ListTile(
                    title: Text(_lista[i]['titulo']),
                    subtitle: Text(_lista[i]['descripcion']),
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
