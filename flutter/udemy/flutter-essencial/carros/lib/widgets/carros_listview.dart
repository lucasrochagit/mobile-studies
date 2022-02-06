import 'package:carros/bloc/carros_bloc.dart';
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
  final CarrosBloc _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  TipoCarro get tipoCarro => widget.tipoCarro;

  @override
  void initState() {
    super.initState();
    _bloc.fetch(tipoCarro);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(
            child: Text(
              "Não foi possível buscar os carros",
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Carro>? carros = snapshot.data as List<Carro>?;
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
