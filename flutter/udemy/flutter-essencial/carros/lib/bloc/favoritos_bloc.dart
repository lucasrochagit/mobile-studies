import 'dart:async';

import 'package:carros/bloc/simple_bloc.dart';
import 'package:carros/db/dao/carro_dao.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/models/favorito.dart';
import 'package:carros/service/favorito_service.dart';
import 'package:carros/utils/network.dart';

class FavoritosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>?> fetch() async {
    try {

      List<Carro> carros = await FavoritoService.getCarros();

      if (carros.isNotEmpty) {
        final dao = CarroDAO();
        carros.forEach(dao.save);
      }

      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
  }
}
