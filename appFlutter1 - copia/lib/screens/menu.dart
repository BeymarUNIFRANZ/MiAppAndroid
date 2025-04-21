import 'package:app_4/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme4.primary,
          title: Center(child: Text('MENU')),
          elevation: 15,
        ),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
