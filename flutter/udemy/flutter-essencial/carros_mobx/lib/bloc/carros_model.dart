import 'package:carros/external/carros_api.dart';
import 'package:carros/models/carro.dart';
import 'package:mobx/mobx.dart';

part 'carros_model.g.dart';

class CarrosModel = CarrosModelBase with _$CarrosModel;

abstract class CarrosModelBase with Store {
  @observable
  List<Carro>? carros;

  @observable
  Exception? error;

  // colocar nos métodos que alteram classe de modelo
  @action
  fetch(TipoCarro tipo) async {
    try {
      error = null;
      carros = await CarrosApi.getCarros(tipo);
    } catch (e) {
      error = e as Exception?;
    }
  }
}
