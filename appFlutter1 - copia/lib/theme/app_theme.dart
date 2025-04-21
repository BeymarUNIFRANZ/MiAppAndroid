import 'package:flutter/material.dart';

class ColoresSistema {
  static const Color primary = Colors.orange;
  static final ThemeData oscuro = ThemeData.dark();
}

class AppTheme {
  static const Color primary = Color.fromARGB(255, 63, 181, 155);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}

class AppTheme2 {
  static const Color primary = Color.fromARGB(255, 32, 113, 244);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}

class AppTheme3 {
  static const Color primary = Color.fromARGB(255, 187, 27, 59);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}

class AppTheme4 {
  static const Color primary = Color.fromARGB(255, 210, 230, 35);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}

class AppTheme5 {
  static const Color primary = Color.fromARGB(255, 243, 183, 78);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}

class AppTheme6 {
  static const Color primary = Colors.deepOrangeAccent;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.amber,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.amber,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}
