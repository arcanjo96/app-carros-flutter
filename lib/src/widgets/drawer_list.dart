import 'package:carros/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {

  final url = "https://picsum.photos/id/862/64/64";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Lucas Arcanjo"),
            accountEmail: Text("lucas@teste.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(url, scale: 0.5),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){ Navigator.pop(context); },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }

  _logout(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushReplacement(
        context,
         MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
