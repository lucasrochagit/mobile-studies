import 'package:carros/bloc/favoritos_bloc.dart';
import 'package:carros/db/dao/carro_dao.dart';
import 'package:carros/db/dao/favorito_dao.dart';
import 'package:carros/main.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/models/favorito.dart';
import 'package:provider/provider.dart';

class FavoritoService {
  static Future<bool> favoritar(context, Carro c) async {
    Favorito f = Favorito.fromCarro(c);
    final dao = FavoritoDAO();
    FavoritosBloc favoritosBloc = Provider.of<FavoritosBloc>(
      context,
      listen: false,
    );
    final bool exists = await dao.exists(c.id!);

    if (exists) {
      // remove dos favoritos
      print("Remove ${c.id} dos favoritos");
      dao.delete(c.id!);
      favoritosBloc.fetch();
    } else {
      print("Add ${c.id} dos favoritos");
      // adiciona aos favoritos
      dao.save(f);
      favoritosBloc.fetch();
    }
    return !exists;
  }

  static Future<List<Carro>> getCarros() async {
    // SELECT * FROM carro c, favorito f WHERE c.id == f.id
    List<Carro> carros = await CarroDAO()
        .query("SELECT * FROM carro c, favorito f WHERE c.id = f.id");
    return carros;
  }

  static Future<bool> isFavorite(Carro c) async {
    // SELECT * FROM carro c, favorito f WHERE c.id == f.id
    if (c.id == null) {
      return false;
    }
    bool exists = await FavoritoDAO().exists(c.id!);
    return exists;
  }
}
