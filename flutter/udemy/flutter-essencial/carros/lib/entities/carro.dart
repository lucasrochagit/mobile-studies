import 'package:carros/entities/entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Carro extends Entity {
  int? id;
  String? nome;
  String? tipo;
  String? descricao;
  String? urlFoto;
  String? urlVideo;
  String? latitude;
  String? longitude;

  Carro(
      {this.id,
      this.nome,
      this.tipo,
      this.descricao,
      this.urlFoto,
      this.urlVideo,
      this.latitude,
      this.longitude});

  Carro.fromJson(Map json) {
    id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    descricao = json['descricao'];
    urlFoto = json['urlFoto'];
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['tipo'] = tipo;
    data['descricao'] = descricao;
    data['urlFoto'] = urlFoto;
    data['urlVideo'] = urlVideo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  LatLng latLng() {
    return LatLng(
      latitude == null ? 0.0 : double.parse(latitude!),
      longitude == null ? 0.0 : double.parse(longitude!),
    );
  }
}
