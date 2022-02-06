import 'package:carros/models/carro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome ?? 'Carro'),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Image.network(carro.urlFoto ?? 'https://www.inovegas.com.br/site/wp-content/uploads/2017/08/sem-foto.jpg'),
    );
  }
}
