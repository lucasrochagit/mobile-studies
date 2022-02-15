import 'package:carros/db/db_helper.dart';
import 'package:carros/models/usuario.dart';
import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Inicializar banco de dados
    Future futureInitDb = DatabaseHelper.getInstance().db;

    // Delay 1 segundo
    Future futureDelayed = Future.delayed(const Duration(seconds: 1));

    // Recuperar usuário
    Future<Usuario?> futureGetUser = Usuario.get();

    Future.wait([futureInitDb, futureDelayed, futureGetUser])
        .then((List values) {
      Usuario? user = values[2];
      if (user != null) {
        push(context, const HomePage(), replace: true);
      } else {
        push(context, const LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
