

import 'package:flutter/material.dart';

class Listview2Screem extends StatelessWidget{
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

  Listview2Screem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Text('ListView2')
        ),
        elevation: 15,
      ),
      body: Center(
        child: ListView.separated(
          itemCount: options.length,
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.insert_comment_sharp),
            title: Text(options[index]),
            trailing: Icon(Icons.arrow_circle_right),
            onTap: () {

              
              /*final books=options[index];
              print(books);*/
            },
          ), 
          separatorBuilder: (_, __) => Divider(), 
          
          )


          /*children: [
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
          ]*/
       
        
      )
    );
  }


}