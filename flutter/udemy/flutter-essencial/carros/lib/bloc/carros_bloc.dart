import 'dart:async';

import 'package:carros/bloc/simple_bloc.dart';
import 'package:carros/db/dao/carro_dao.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/utils/network.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>?> fetch(TipoCarro tipo) async {
    try {
      bool networkOn = await isNetworkOn();

      if (!networkOn) {
        return await CarroDAO().findAllByTipo(tipo.name);
      }

      List<Carro> carros = await CarrosApi.getCarros(tipo);

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
