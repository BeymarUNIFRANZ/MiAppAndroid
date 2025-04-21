import 'package:app_4/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Comida extends StatelessWidget {
  const Comida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme5.primary,
          title: Center(child: Text('COMIDA')),
          elevation: 15,
        ),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
