import 'package:carros/db/dao/base_dao.dart';
import 'package:carros/models/carro.dart';

// Data Access Object
class CarroDAO extends BaseDAO<Carro> {
  @override
  String get tableName => "carro";

  @override
  Carro fromMap(Map<String, dynamic> map) {
    return Carro.fromJson(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo) async {
    final dbClient = await db;
    final list = await dbClient!
        .rawQuery('select * from $tableName where tipo =? ', [tipo]);
    return list.map<Carro>((json) => fromMap(json)).toList();
  }
}
