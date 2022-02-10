import 'package:carros/bloc/carros_model.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/pages/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  final CarrosModel _model = CarrosModel();

  @override
  bool get wantKeepAlive => true;

  TipoCarro get tipoCarro => widget.tipoCarro;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    _model.fetch(tipoCarro);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Observer(
      builder: (_) {
        List<Carro>? carros = _model.carros;

        if (_model.error != null) {
          return TextError(
            "Não foi possível exibir os carros\n\nClique aqui para tentar novamente",
            onPressed: _fetch,
          );
        }

        if (_model.carros == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return _listView(carros!);
      },
    );
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
