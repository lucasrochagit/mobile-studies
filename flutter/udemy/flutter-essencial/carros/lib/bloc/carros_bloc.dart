import 'dart:async';

import 'package:carros/bloc/simple_bloc.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/models/carro.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>?> fetch(TipoCarro tipo) async {
    try {
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      add(carros);
      return carros;
    } catch (e) {
      addError(e);
    }
  }
}
