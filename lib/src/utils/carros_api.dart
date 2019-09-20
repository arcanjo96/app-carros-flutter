import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:carros/src/models/carro.dart';

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    final url = "https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo";

    final response = await http.get(url);

    List list = json.decode(response.body);

    final carros = list.map<Carro>((item) => Carro.fromJson(item)).toList();

    return carros;
  }
}