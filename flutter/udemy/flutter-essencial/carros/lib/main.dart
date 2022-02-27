import 'package:carros/pages/login_page.dart';
import 'package:carros/pages/splash_page.dart';
import 'package:flutter/material.dart';

import 'bloc/favoritos_bloc.dart';

final FavoritosBloc favoritosBloc = FavoritosBloc();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashPage(),
    );
  }
}
