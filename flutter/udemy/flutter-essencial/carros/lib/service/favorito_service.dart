import 'package:carros/db/dao/carro_dao.dart';
import 'package:carros/db/dao/favorito_dao.dart';
import 'package:carros/entities/carro.dart';
import 'package:carros/entities/favorito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FavoritoService {
  CollectionReference get _carros =>
      FirebaseFirestore.instance.collection('carros');

  Stream<QuerySnapshot> get stream => _carros.snapshots();

  Future<bool> favoritar(Carro c) async {
    DocumentReference docRef = _carros.doc(c.id.toString());
    DocumentSnapshot doc = await docRef.get();
    final exists = doc.exists;

    if (exists) {
      // remove dos favoritos
      print("Remove ${c.id} dos favoritos");
      docRef.delete();
    } else {
      print("Add ${c.id} dos favoritos");
      // adiciona aos favoritos
      docRef.set(c.toMap());
    }
    return !exists;
  }

  Future<bool> isFavorite(Carro c) async {
    if (c.id == null) {
      return false;
    }
    DocumentReference docRef = _carros.doc(c.id.toString());
    DocumentSnapshot doc = await docRef.get();
    return doc.exists;
  }
}
