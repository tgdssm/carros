import 'package:cars/carro/carro.dart';
import 'package:cars/carro/carros_api.dart';
import 'package:cars/carro/carros_list.dart';
import 'package:cars/widgets/button.dart';
import 'package:cars/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: "Clássicos",),
            Tab(text: "Esportivos",),
            Tab(text: "Luxo",)
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            CarrosList(Tipos.classicos),
            CarrosList(Tipos.esportivos),
            CarrosList(Tipos.luxo),
          ],
        ),
        drawer: DrawerList(),

      ),
    );
  }

}
