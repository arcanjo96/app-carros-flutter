import 'dart:convert';

import 'package:carros/src/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:carros/src/models/carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {

    Usuario user = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var url = "https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo";

    var response = await http.get(url, headers: headers);

    print(response.body);

    List list = json.decode(response.body);

    final carros = list.map<Carro>((item) => Carro.fromJson(item)).toList();

    return carros;
  }
}