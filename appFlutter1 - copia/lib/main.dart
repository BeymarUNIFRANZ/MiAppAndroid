import 'package:app_4/screens/home_screen.dart';
import 'package:app_4/screens/screens.dart'
    show
        AlertScreem,
        CardScreen,
        Comida,
        Encantamientos,
        Items,
        Jugador,
        Listview1Screem,
        Listview2Screem,
        Menu;

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: 'HomeScreen',
      routes: {
        'HomeScreen': (BuildContext context) => HomeScreen(),
        'ListView1': (BuildContext context) => Listview1Screem(),
        'ListView2': (BuildContext context) => Listview2Screem(),
        'cardScreem': (BuildContext context) => CardScreen(),
        'AlerScreem': (BuildContext context) => AlertScreem(),
        'encantamientos': (BuildContext context) => Encantamientos(),
        'comida': (BuildContext context) => Comida(),
        'jugador': (BuildContext context) => Jugador(),
        'items': (BuildContext context) => Items(),
        'menu': (BuildContext context) => Menu(),
      },
      //rutas dinamicas

      // vamos a volverlo estetico todo el codigo

      /*onGenerateRoute:(settings) {
       //print(settings);
       return MaterialPageRoute(
        builder:(context) => AlertScreem(), 
       );

     } ,*/
    );
  }
}
