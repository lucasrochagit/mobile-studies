import 'dart:convert';

import 'package:carros/models/entity.dart';
import 'package:carros/utils/prefs.dart';

class Usuario extends Entity {
  int? id;
  String? login;
  String? nome;
  String? email;
  String? urlFoto;
  String? token;
  List<String>? roles;

  Usuario(
      {this.id,
      this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['login'] = login;
    data['nome'] = nome;
    data['email'] = email;
    data['urlFoto'] = urlFoto;
    data['token'] = token;
    data['roles'] = roles;
    return data;
  }

  void save() {
    Map map = toMap();
    String jsonStr = jsonEncode(map);
    Prefs.setString("user.prefs", jsonStr);
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  static Future<Usuario?> get() async {
    String jsonStr = await Prefs.getString("user.prefs");
    if (jsonStr.isEmpty) {
      return null;
    }
    Map<String, dynamic> result = jsonDecode(jsonStr);
    return Usuario.fromJson(result);
  }
}
