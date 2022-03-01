import 'package:carros/entities/carro.dart';
import 'package:carros/widgets/carros_listview.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('carros').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return const TextError("Não foi possível exibir os carros");
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Carro>? carros =
            snapshot.data?.docs.map((QueryDocumentSnapshot doc) {
          return Carro.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        return CarrosListView(carros!);
      },
    );
  }
}
