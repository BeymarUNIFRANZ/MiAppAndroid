import 'package:app_4/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:app_4/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOption;
    return Center(
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: false,
          backgroundColor: ColoresSistema.primary,
          title: Text('HomeScreen'),
        ),
        body: ListView.separated(
          itemCount: menuOptions.length,
          itemBuilder:
              (context, index) => ListTile(
                leading: Icon(menuOptions[index].icon),
                title: Text(menuOptions[index].name),
                onTap: () {
                  Navigator.pushNamed(context, menuOptions[index].route);
                  //Primera forma
                  /*final route=MaterialPageRoute(
                  builder: (context) => Listview1Screem(),
                );*/

                  //Aplicacion forma 1
                  /*Navigator.push(context, route);*/
                  //Aplicacion forma 2
                  //Navigator.pushReplacement(context, route);
                },
              ),
          separatorBuilder: (_, __) => Divider(),
        ),
      ),
    );
  }
}
