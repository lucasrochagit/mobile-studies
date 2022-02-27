import 'package:carros/entities/carro.dart';
import 'package:carros/models/favoritos_model.dart';
import 'package:carros/widgets/carros_listview.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin<FavoritosPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    FavoritosModel model = Provider.of<FavoritosModel>(
      context,
      listen: false,
    );
    model.getCarros();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    FavoritosModel model = Provider.of<FavoritosModel>(context);

    List<Carro> carros = model.carros;

    if (carros.isEmpty) {
      return const Center(
        child: Text(
          "Nenhum carro nso favoritos",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: CarrosListView(carros),
    );
  }

  Future<List<Carro>> _onRefresh() async {
    return Provider.of<FavoritosModel>(context, listen: false).getCarros();
  }
}
