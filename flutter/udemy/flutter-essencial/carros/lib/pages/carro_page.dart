import 'package:carros/models/carro.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome ?? 'Carro'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: _onClickMap(),
            icon: const Icon(
              Icons.place,
            ),
          ),
          IconButton(
            onPressed: _onClickVideo(),
            icon: const Icon(
              Icons.videocam,
            ),
          ),
          PopupMenuButton(
              onSelected: _onClickPopupMenu,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text("Editar"),
                    value: "Editar",
                  ),
                  const PopupMenuItem(
                    child: Text("Deletar"),
                    value: "Deletar",
                  ),
                  const PopupMenuItem(
                    child: Text("Compartilhar"),
                    value: "Compartilhar",
                  )
                ];
              })
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Image.network(carro.urlFoto ??
          'https://www.inovegas.com.br/site/wp-content/uploads/2017/08/sem-foto.jpg'),
    );
  }

  _onClickMap() {}

  _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        print("Editar!!");
        break;
      case "Deletar":
        print("Deletar!!");
        break;
      case "Compartilhar":
        print("Compartilhar!!");
        break;
      default:
        break;
    }
  }
}
