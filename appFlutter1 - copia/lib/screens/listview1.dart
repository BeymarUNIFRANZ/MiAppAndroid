

import 'package:flutter/material.dart';

class Listview1Screem extends StatelessWidget{
  //vamos a crear una lista de nuestro proyecto biblioteca
  final options= ['Ciencia de Datos',
                  'Calculo diferencial',
                  'Mecanica de Fluidos',
                  'Resistencia de Materiales',
                  'Calculo Vectorial',
                  'Estadistica',
                  'Tensores',
                  'Mecanica Lagrangiana',
                  'Embebidos'];

  Listview1Screem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Text('ListView1')
        ),
        elevation: 15,
      ),
      body: Center(
        child: ListView(
          children: [
            ...options.map(
              (libro)=>ListTile(
              dense: false,
              focusColor: Colors.amber,
              leading: Icon(Icons.insert_comment_sharp),
              title: Text(libro),
              trailing: Icon(Icons.arrow_circle_right),
              onTap: () {
              
              },
            ))
          ]
          //Generamos un listTile independiente, pero para realizar procesos mucho mas complejos
          //generar tantas lineas de codigo es perjudicial para nuestro sistema
          //asi que creamos un Map
         /* children: [
            ListTile(
              dense: false,
              focusColor: Colors.amber,
              leading: Icon(Icons.insert_comment_sharp),
              title: Text('hola que tal'),
              trailing: Icon(Icons.add_ic_call_outlined),
              onTap: () {
              
              },
            )
          ],*/
        ),
      )
    );
  }


}