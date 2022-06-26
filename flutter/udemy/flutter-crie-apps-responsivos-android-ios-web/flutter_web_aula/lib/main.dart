import 'package:flutter/material.dart';
import 'package:flutter_web_aula/responsiveness_row_column.dart';
import 'package:flutter_web_aula/responsiveness_wrap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ResponsivenessMediaQuery(),
      // home: const ResponsivenessRowColumn(),
      home: const ResponsivenessWrap(),
    );
  }
}
