import 'dart:convert';

import 'package:carros/models/api_response.dart';
import 'package:carros/models/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>?> login(String login, String senha) async {
    try {
      final Uri url =
          Uri.parse('http://carros-springboot.herokuapp.com/api/v2/login');
      final Map body = {
        'username': login,
        'password': senha,
      };

      final Map<String, String> headers = {'Content-Type': 'application/json'};

      var response =
          await http.post(url, body: json.encode(body), headers: headers);

      Map<String, dynamic> mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse.ok(Usuario.fromJson(mapResponse));
      }

      return ApiResponse.error(mapResponse['error']);
    } catch (error, exception) {
      print("Erro no login $error > $exception");
      return ApiResponse.error('Não foi possível fazer o login.');
    }
  }
}
