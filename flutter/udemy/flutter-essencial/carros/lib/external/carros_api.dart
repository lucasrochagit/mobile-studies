import 'package:carros/models/carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final carros = <Carro>[
      Carro(
          nome: "Ford Mustang 1976 BBBA",
          urlFoto:
              "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Ford_Mustang.png"),
      Carro(
          nome: "Chevrolet Corvette Z06",
          urlFoto:
              "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Chevrolet_Corvette_Z06.png"),
      Carro(
          nome: "BMW M5",
          urlFoto:
              "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/BMW.png")
    ];

    return carros;
  }
}
