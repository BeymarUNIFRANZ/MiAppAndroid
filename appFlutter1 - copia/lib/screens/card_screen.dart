import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Screen - Widget")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.add_ic_call_outlined),
                  title: Text('tarjetita 1'),
                  subtitle: Text("Wenas soy Beymar"),
                ), // ListTile
              ],
            ), // Column
          ), // Card
        ], // children
      ), // ListView
    ); // Scaffold
  }
}
