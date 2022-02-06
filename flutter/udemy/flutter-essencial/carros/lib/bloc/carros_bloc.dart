import 'dart:async';

import 'package:carros/external/carros_api.dart';
import 'package:carros/models/carro.dart';

class CarrosBloc {
  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;

  void fetch(TipoCarro tipo) async {
    List<Carro> carros = await CarrosApi.getCarros(tipo);
    _streamController.add(carros);
  }

  void dispose() {
    _streamController.close();
  }
}
