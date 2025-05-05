import 'package:flutter/material.dart';
import '../db/db_notas.dart';

class EjemploNotas extends StatefulWidget {
  const EjemploNotas({super.key});
  @override
  State<EjemploNotas> createState() => _EjemploNotasState();
}

class _EjemploNotasState extends State<EjemploNotas> {
  final _tituloCtrl = TextEditingController();
  final _contenidoCtrl = TextEditingController();
  List<Map<String, dynamic>> _lista = [];

  void _cargarNotas() async {
    final datos = await DBNotas.obtenerNotas();
    setState(() => _lista = datos);
  }

  void _agregar() async {
    await DBNotas.agregarNota(_tituloCtrl.text, _contenidoCtrl.text);
    _tituloCtrl.clear();
    _contenidoCtrl.clear();
    _cargarNotas();
  }

  void _eliminar(int id) async {
    await DBNotas.eliminarNota(id);
    _cargarNotas();
  }

  @override
  void initState() {
    super.initState();
    _cargarNotas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notas")),
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
                  controller: _contenidoCtrl,
                  decoration: const InputDecoration(labelText: 'Contenido'),
                ),
                ElevatedButton(
                  onPressed: _agregar,
                  child: const Text("Agregar Nota"),
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
                    subtitle: Text(_lista[i]['contenido']),
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
