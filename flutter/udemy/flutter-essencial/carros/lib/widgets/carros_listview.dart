import 'package:carros/external/carros_api.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/pages/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarrosListView extends StatefulWidget {
  final TipoCarro tipoCarro;

  const CarrosListView({
    this.tipoCarro = TipoCarro.esportivos,
    Key? key,
  }) : super(key: key);

  @override
  State<CarrosListView> createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  List<Carro>? carros;

  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    List<Carro> carros = await CarrosApi.getCarros(widget.tipoCarro);
    setState(() {
      this.carros = carros;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (carros == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return _listView(carros!);
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro c = carros[index];

            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto ??
                            "https://www.inovegas.com.br/site/wp-content/uploads/2017/08/sem-foto.jpg",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome ?? "Carro Não Identificado",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      'Descrição....',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: <Widget>[
                          TextButton(
                            child: const Text('DETALHES'),
                            onPressed: () => _onClickDetails(c),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('COMPARTILHAR'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  _onClickDetails(Carro c) {
    push(context, CarroPage(c));
  }
}
