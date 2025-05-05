import 'package:flutter/material.dart';

class InventarioEjemplo extends StatelessWidget {
  const InventarioEjemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inventario")),
      body: Center(
        child: Text(
          "Gestión de Inventario",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
