import 'package:carros/const/const.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/widgets/text.dart';
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
      child: ListView(
        children: <Widget>[
          Image.network(carro.urlFoto ?? Const.defaultCarroFoto),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(carro.nome, fontSize: 20, bold: true),
                  text(carro.tipo, fontSize: 16),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: _onClickFavorito,
                    icon:
                    const Icon(Icons.favorite, color: Colors.red, size: 40),
                  ),
                  IconButton(
                    onPressed: onClickCompartilhar,
                    icon:
                    const Icon(Icons.share, color: Colors.black, size: 40),
                  )
                ],
              )
            ],
          )
        ],
      ),
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

  void _onClickFavorito() {}

  void onClickCompartilhar() {}
}
