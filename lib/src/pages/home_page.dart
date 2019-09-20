import 'package:carros/src/models/carro.dart';
import 'package:carros/src/utils/carros_api.dart';
import 'package:carros/src/utils/carros_list.dart';
import 'package:carros/src/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Clássicos",),
              Tab(text: "Esportivos",),
              Tab(text: "Luxo",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CarrosList("classicos"),
            CarrosList("esportivos"),
            CarrosList("luxo"),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }
}
