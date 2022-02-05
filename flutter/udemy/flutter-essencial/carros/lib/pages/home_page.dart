import 'package:carros/drawer_list.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/models/carro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Carros"),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  _body() {
    List<Carro> carros = CarrosApi.getCarros();

    return ListView.builder(
        // itemCount: carros.length,
        itemCount: 3,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Row(
            children: <Widget>[
              Image.network(
                c.urlFoto!,
                width: 150,
              ),
              Flexible(
                child: Text(
                  c.nome!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
