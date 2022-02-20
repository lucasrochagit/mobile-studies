import 'package:carros/models/entity.dart';

class Favorito extends Entity {
  int? id;
  String? nome;

  Favorito({this.id, this.nome});

  Favorito.fromJson(Map json) {
    id = json['id'];
    nome = json['nome'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    return data;
  }
}
