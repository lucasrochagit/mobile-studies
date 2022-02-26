import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class UploadService {
  static Future<String> uploadFile(File file) async {
    Uri url = Uri.parse("https://carros-springboot.herokuapp.com/api/v1/upload");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

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
        .post(url, headers: headers, body: body)
        .timeout(const Duration(seconds: 30), onTimeout: _onTimeout);

    print(">> response ${response.body}");
    Map map = json.decode(response.body);
    return map['url'] ?? 'Upload failed';
  }

  static FutureOr<http.Response> _onTimeout() {
    print('timeout');
    throw const SocketException('Não foi possível se conectar com o servidor');
  }
}
