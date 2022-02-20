import 'package:carros/bloc/loripsum_bloc.dart';
import 'package:carros/const/const.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/pages/carro_form_page.dart';
import 'package:carros/service/favorito_service.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatefulWidget {
  Carro carro;

  CarroPage(this.carro, {Key? key}) : super(key: key);

  @override
  State<CarroPage> createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _loripsumApiBlock = LoripsumBloc();

  var favColor = Colors.grey;

  Carro get carro => widget.carro;

  @override
  void initState() {
    super.initState();

    FavoritoService.isFavorite(carro).then((fav) {
      setState(() {
        favColor = fav ? Colors.red : Colors.grey;
      });
    });

    _loripsumApiBlock.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    _loripsumApiBlock.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome ?? 'Carro'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: _onClickMap,
            icon: const Icon(
              Icons.place,
            ),
          ),
          IconButton(
            onPressed: _onClickVideo,
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
          Image.network(widget.carro.urlFoto ?? Const.defaultCarroFoto),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(widget.carro.nome, fontSize: 20, bold: true),
                  text(widget.carro.tipo, fontSize: 16),
                ],
              ),
              _bloco1(),
            ],
          ),
          const Divider(),
          _bloco2()
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: _onClickFavorito,
          icon: Icon(
            Icons.favorite,
            color: favColor,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: onClickCompartilhar,
          icon: const Icon(
            Icons.share,
            color: Colors.black,
            size: 40,
          ),
        )
      ],
    );
  }

  _onClickMap() {
    print("Localização");
  }

  _onClickVideo() {
    print("Exibir Vídeo");
  }

  _onClickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        _onClickEditar();
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

  void _onClickFavorito() async {
    bool fav = await FavoritoService.favoritar(carro);

    setState(() {
      favColor = fav ? Colors.red : Colors.grey;
    });
  }

  void onClickCompartilhar() {}

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20),
        text(widget.carro.descricao, fontSize: 16, bold: true),
        const SizedBox(height: 20),
        StreamBuilder<String>(
          stream: _loripsumApiBlock.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return text(snapshot.data, fontSize: 16);
          },
        ),
      ],
    );
  }

  _onClickEditar() {
    push(context, CarroFormPage(carro: carro));
  }
}
