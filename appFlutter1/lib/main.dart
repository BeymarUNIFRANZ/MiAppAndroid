import 'package:flutter/material.dart';
import 'examples/tareas.dart';
import 'examples/notas.dart';
import 'examples/usuarios.dart';
import 'examples/inventario.dart'; // Importar inventario

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Multi SQLite Demo', home: const MenuPrincipal());
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejemplos SQLite Separados")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Gestión de Tareas"),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EjemploTareas()),
                ),
          ),
          ListTile(
            title: const Text("Gestión de Notas"),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EjemploNotas()),
                ),
          ),
          ListTile(
            title: const Text("Gestión de Usuarios"),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EjemploUsuarios()),
                ),
          ),
          ListTile(
            title: const Text("Gestión de Inventario"),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InventarioEjemplo()),
                ),
          ),
        ],
      ),
    );
  }
}
