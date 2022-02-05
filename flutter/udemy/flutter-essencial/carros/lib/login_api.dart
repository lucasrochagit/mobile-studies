import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async {
    final Uri url =
        Uri.parse('http://carros-springboot.herokuapp.com/api/v2/login');
    final Map body = {
      'username': login,
      'password': senha,
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json'
    };

    var response = await http.post(url, body: json.encode(body), headers: headers);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map mapResponse = json.decode(response.body);

    String nome = mapResponse['nome'];
    String email = mapResponse['email'];

    print("Nome $nome, email $email");

    return response.statusCode == 200;
  }
}
