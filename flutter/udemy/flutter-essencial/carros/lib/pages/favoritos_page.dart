import 'package:carros/bloc/carros_bloc.dart';
import 'package:carros/bloc/favoritos_bloc.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/main.dart';
import 'package:carros/models/carro.dart';
import 'package:carros/widgets/carros_listview.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';

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
    favoritosBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: favoritosBloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return const TextError("Não foi possível exibir os carros");
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Carro>? carros = snapshot.data as List<Carro>?;
        return RefreshIndicator(
            onRefresh: _onRefresh,
            child: CarrosListView(carros!));
      },
    );
  }

  Future<List<Carro>?> _onRefresh() async {
    return favoritosBloc.fetch();
  }
}
