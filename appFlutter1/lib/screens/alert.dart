import 'package:flutter/material.dart';


class AlertScreem extends StatelessWidget {
  const AlertScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text('hi'),
        ),
      ),
    );
  }
}