import 'dart:convert';

import 'package:carros/src/utils/prefs.dart';

class Usuario {
  int id;
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  Usuario(
      {this.id,
        this.login,
        this.nome,
        this.email,
        this.urlFoto,
        this.token,
        this.roles});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  void save() {
    Map map = toJson();

    String _json = json.encode(map);

    Prefs.setString("user.prefs", _json);
  }

  static Future<Usuario> get() async {
    String _json = await Prefs.getString("user.prefs");

    if(_json.isEmpty) {
      return null;
    }

    Map map = json.decode(_json);

    Usuario user = Usuario.fromJson(map);

    return user;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  @override
  String toString() {
    return 'Usuario{id: $id, login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
  }


}