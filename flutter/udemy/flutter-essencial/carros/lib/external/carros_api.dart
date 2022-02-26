import 'dart:convert';

import 'package:carros/models/api_response.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/models/usuario.dart';
import 'package:http/http.dart' as http;

enum TipoCarro { classicos, esportivos, luxo }

class CarrosApi {
  static Future<List<Carro>> getCarros(TipoCarro tipoCarro) async {
    final Uri url = Uri.parse(
        'http://carros-springboot.herokuapp.com/api/v2/carros/tipo/${tipoCarro.name}');
    print("> GET $url");

    Usuario? user = await Usuario.get();

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${user?.token ?? ''}'
    };

    var response = await http.get(url, headers: headers);
    List list = json.decode(response.body);

    return list.map<Carro>((map) => Carro.fromJson(map)).toList();
  }

  static Future<ApiResponse<bool>> save(Carro c) async {
    try {
      Usuario? user = await Usuario.get();
      final Uri url =
          Uri.parse('http://carros-springboot.herokuapp.com/api/v2/carros');
      print("> POST $url");

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user?.token ?? ''}'
      };
      String body = json.encode(c.toMap());

      var response = await http.post(url, body: body, headers: headers);

      if (response.statusCode == 201) {
        Map mapResponse = json.decode(response.body);
        print("Novo Carro: ${mapResponse['id']}");
        return ApiResponse.ok(true);
      }

      if (response.body.isEmpty) {
        return ApiResponse.error("Não foi possível salvar o carro");
      }

      Map mapResponse = json.decode(response.body);
      return ApiResponse.error(mapResponse['error']);
    } catch (e) {
      print(e);
      return ApiResponse.error("Não foi possível salvar o carro");
    }
  }

  static Future<ApiResponse<bool>> update(Carro c) async {
    try {
      Usuario? user = await Usuario.get();
      final Uri url = Uri.parse(
          'http://carros-springboot.herokuapp.com/api/v2/carros/${c.id}');
      print("> PUT $url");

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user?.token ?? ''}'
      };
      String body = json.encode(c.toMap());

      var response = await http.put(url, body: body, headers: headers);

      if (response.statusCode == 200) {
        Map mapResponse = json.decode(response.body);
        print("Carro Atualizado: ${mapResponse['id']}");
        return ApiResponse.ok(true);
      }

      if (response.body.isEmpty) {
        return ApiResponse.error("Não foi possível atualizar o carro");
      }

      Map mapResponse = json.decode(response.body);
      return ApiResponse.error(mapResponse['error']);
    } catch (e) {
      print(e);
      return ApiResponse.error("Não foi possível atualizar o carro");
    }
  }

  static Future<ApiResponse<bool>> delete(int id) async {
    try {
      Usuario? user = await Usuario.get();
      final Uri url = Uri.parse(
          'http://carros-springboot.herokuapp.com/api/v2/carros/$id');
      print("> DELETE $url");

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${user?.token ?? ''}'
      };

      var response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        print("Carro Removido: ${id}");
        return ApiResponse.ok(true);
      }

      if (response.body.isEmpty) {
        return ApiResponse.error("Não foi possível remover o carro");
      }

      Map mapResponse = json.decode(response.body);
      return ApiResponse.error(mapResponse['error']);
    } catch (e) {
      print(e);
      return ApiResponse.error("Não foi possível remover o carro");
    }
  }
}
