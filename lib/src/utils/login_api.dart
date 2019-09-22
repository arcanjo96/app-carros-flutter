import 'dart:convert';
import 'package:carros/src/models/usuario.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String password) async {
    try {

      final url = "https://carros-springboot.herokuapp.com/api/v2/login";

      Map params = {
        "username": login,
        "password": password,
      };

      Map<String, String> headers = {
        "Content-Type": "application/json"
      };

      String myParams = json.encode(params);

      json.encode(params);

      final response = await http.post(url, body: myParams, headers: headers);

      Map mapResponse = json.decode(response.body);

      if(response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        user.save();

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch(e, exception) {
      print("Erro no login $e -> $exception");
      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}