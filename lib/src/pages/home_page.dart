import 'package:carros/src/models/carro.dart';
import 'package:carros/src/utils/carros_api.dart';
import 'package:carros/src/utils/carros_list.dart';
import 'package:carros/src/utils/prefs.dart';
import 'package:carros/src/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {

  TabController _tabController;


  @override
  void initState() {
    super.initState();

    _initTabs();
  }

  _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);

    _tabController.index = await Prefs.getInt("tabIndex");

    _tabController.addListener(() {
      print("Tab: ${_tabController.index}");

      Prefs.setInt("tabIndex", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: "Clássicos",),
            Tab(text: "Esportivos",),
            Tab(text: "Luxo",),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CarrosList("classicos"),
          CarrosList("esportivos"),
          CarrosList("luxo"),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}
