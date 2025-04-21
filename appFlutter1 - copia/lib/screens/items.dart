import 'package:app_4/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primary,
          title: Center(child: Text('ITEMS')),
          elevation: 15,
        ),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
