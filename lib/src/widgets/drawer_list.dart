import 'package:carros/src/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../models/usuario.dart';

class DrawerList extends StatelessWidget {

  Future<Usuario> user = Usuario.get();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          FutureBuilder(
            future: user,
            builder: (context, snapshot) {
              Usuario user = snapshot.data;

              return user != null ? _userAccount(user) : Container();
            },
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

  UserAccountsDrawerHeader _userAccount(Usuario user) {
    return UserAccountsDrawerHeader(
          accountName: Text(user.nome),
          accountEmail: Text(user.email),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(user.urlFoto, scale: 0.5),
          ),
        );
  }

  _logout(BuildContext context) {
    Usuario.clear();
    Navigator.pop(context);
    Navigator.pushReplacement(
        context,
         MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

}
