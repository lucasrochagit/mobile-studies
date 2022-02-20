import 'package:carros/db/dao/base_dao.dart';
import 'package:carros/models/favorito.dart';

class FavoritoDAO extends BaseDAO<Favorito> {
  @override
  String get tableName => "favorito";

  @override
  Favorito fromMap(Map<String, dynamic> map) {
    return Favorito.fromJson(map);
  }
}
