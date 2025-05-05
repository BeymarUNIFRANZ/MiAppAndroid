import 'package:app_4/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Encantamientos extends StatelessWidget {
  const Encantamientos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme3.primary,
          title: Center(child: Text('ENCANTAMIENTOS')),
          elevation: 15,
        ),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
