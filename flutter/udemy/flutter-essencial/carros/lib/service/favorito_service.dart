import 'package:carros/db/dao/favorito_dao.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/models/favorito.dart';

class FavoritoService {
  static favoritar(Carro c) async {
    Favorito f = Favorito.fromCarro(c);
    final dao = FavoritoDAO();

    final bool exists = await dao.exists(c.id!);

    if (exists) {
      // remove dos favoritos
      print("Remove ${c.id} dos favoritos");
      dao.delete(c.id!);
    } else {
      print("Add ${c.id} dos favoritos");
      // adiciona aos favoritos
      dao.save(f);
    }
  }

  static List<Carro> getCarros() {
    List<Carro> carros =  [];
    return carros;
  }
}
