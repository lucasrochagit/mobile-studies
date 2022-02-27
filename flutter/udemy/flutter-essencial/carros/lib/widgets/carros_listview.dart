import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/const/const.dart';
import 'package:carros/entities/carro.dart';
import 'package:carros/pages/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarrosListView extends StatelessWidget {
  List<Carro> carros;

  CarrosListView(this.carros, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: CachedNetworkImage(
                        imageUrl: c.urlFoto ?? Const.defaultCarroFoto,
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
                            onPressed: () => _onClickDetails(context, c),
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

  _onClickDetails(BuildContext context, Carro c) {
    push(context, CarroPage(c));
  }
}
