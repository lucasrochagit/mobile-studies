import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carros/models/carro.dart';

enum TipoCarro { classicos, esportivos, luxo }

class CarrosApi {
  static Future<List<Carro>> getCarros(TipoCarro tipoCarro) async {
    final Uri url = Uri.parse(
        'http://carros-springboot.herokuapp.com/api/v1/carros/tipo/${tipoCarro.name}');

    print("GET >> $url");
    var response = await http.get(url);

    List list = json.decode(response.body);

    return list.map<Carro>((map) => Carro.fromJson(map)).toList();
  }
}
