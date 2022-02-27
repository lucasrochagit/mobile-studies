import 'package:carros/db/dao/base_dao.dart';
import 'package:carros/entities/carro.dart';

// Data Access Object
class CarroDAO extends BaseDAO<Carro> {
  @override
  String get tableName => "carro";

  @override
  Carro fromMap(Map<String, dynamic> map) {
    return Carro.fromJson(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo) {
    return query('select * from $tableName where tipo =? ', [tipo]);
  }
}
