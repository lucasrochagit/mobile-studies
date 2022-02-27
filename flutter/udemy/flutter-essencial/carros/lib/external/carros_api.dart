import 'dart:convert';
import 'dart:io';

import 'package:carros/external/upload_api.dart';
import 'package:carros/entities/api_response.dart';
import 'package:carros/entities/carro.dart';
import 'package:carros/utils/http_helper.dart' as http;

enum TipoCarro { classicos, esportivos, luxo }

class CarrosApi {
  static Future<List<Carro>> getCarros(TipoCarro tipoCarro) async {
    String url =
        'http://carros-springboot.herokuapp.com/api/v2/carros/tipo/${tipoCarro.name}';
    print("> GET $url");
    var response = await http.get(url);
    List list = json.decode(response.body);
    return list.map<Carro>((map) => Carro.fromJson(map)).toList();
  }

  static Future<ApiResponse<bool>> save(Carro c, File? file) async {
    try {
      String url = 'http://carros-springboot.herokuapp.com/api/v2/carros';

      if (file != null) {
        ApiResponse<String> response = await UploadApi.upload(file);
        if (response.ok!) {
          String urlFoto = response.result!;
          print(">> URLFOTO $urlFoto");
          c.urlFoto = urlFoto;
        }
      }

      String body = json.encode(c.toMap());
      print("> POST $url");
      var response = await http.post(url, body: body);
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
      String url =
          'http://carros-springboot.herokuapp.com/api/v2/carros/${c.id}';
      String body = json.encode(c.toMap());
      print("> PUT $url");
      var response = await http.put(url, body: body);
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
      String url = 'http://carros-springboot.herokuapp.com/api/v2/carros/$id';
      print("> DELETE $url");
      var response = await http.delete(url);
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
