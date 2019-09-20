class Usuario {
  String nome;
  String email;
  String login;
  String token;

  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map) {
    nome = map["nome"];
    email = map["email"];
    login = map["login"];
    token = map["token"];
    roles = map["roles"] != null ? map["roles"].map<String>((role) => role.toString()).toList() : null;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Usuário: Nome: $nome, Email: $email, Roles: $roles";
  }

}