import 'package:carros/entities/usuario.dart';
import 'package:http/http.dart' as http;

Future<http.Response> get(String url) async {
  final headers = await _headers();
  var response = await http.get(Uri.parse(url), headers: headers);
  return response;
}

Future<http.Response> post(String url, {body}) async {
  final headers = await _headers();
  var response = await http.post(Uri.parse(url), body: body, headers: headers);
  return response;
}

Future<http.Response> put(String url, {body}) async {
  final headers = await _headers();
  var response = await http.put(Uri.parse(url), headers: headers);
  return response;
}

Future<http.Response> delete(String url) async {
  final headers = await _headers();
  var response = await http.delete(Uri.parse(url), headers: headers);
  return response;
}

Future<Map<String, String>> _headers() async {
  Usuario? user = await Usuario.get();

  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${user?.token ?? ''}'
  };
}
