import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:carros/models/api_response.dart';
import 'package:carros/utils/http_helper.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

class UploadApi {
  static Future<ApiResponse<String>> upload(File file) async {
    try {
      String url = 'http://carros-springboot.herokuapp.com/api/v2/upload';
      List<int> bytes = file.readAsBytesSync();
      String base64 = base64Encode(bytes);
      String filename = path.basename(file.path);

      Map params = {
        'filename': filename,
        'mimeType': 'image/jpeg',
        'base64': base64
      };

      print(">> POST $url");

      print("Params: $params");

      String body = json.encode(params);
      var response = await http
          .post(url, body: body)
          .timeout(const Duration(seconds: 30), onTimeout: _onTimeout);
      if (response.statusCode == 201) {
        Map mapResponse = json.decode(response.body);
        return ApiResponse.ok(mapResponse['url']);
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

  static FutureOr<Response> _onTimeout() {
    print('timeout');
    throw const SocketException('Não foi possível se conectar com o servidor');
  }
}
