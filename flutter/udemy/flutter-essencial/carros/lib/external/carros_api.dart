import 'package:carros/db/dao/carro_dao.dart';
import 'package:carros/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carros/models/carro.dart';

enum TipoCarro { classicos, esportivos, luxo }

class CarrosApi {
  static Future<List<Carro>> getCarros(TipoCarro tipoCarro) async {
    final Uri url = Uri.parse(
        'http://carros-springboot.herokuapp.com/api/v2/carros/tipo/${tipoCarro.name}');

    Usuario? user = await Usuario.get();

    print("> GET $url");

    final Map<String, String> headers = {'Content-Type': 'application/json',
    'Authorization': 'Bearer ${user?.token ?? ''}'};

    var response = await http.get(url, headers: headers);
    List list = json.decode(response.body);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    final dao = CarroDAO();

    carros.forEach(dao.save);

    return carros;
  }
}
