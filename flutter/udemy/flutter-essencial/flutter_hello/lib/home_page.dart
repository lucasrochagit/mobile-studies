import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Hello Flutter",
          ),
        ),
        body: _body());
  }

  Container _body() {
    return Container(
      color: Colors.white,
      child: Center(
        // child: _text(),
        child: _img()
      ),
    );
  }

  Image _img() {
    return Image.asset(
      "assets/images/dog4.png",
      // width: 300,
      // height: 300,
      fit: BoxFit.cover
    );
  }

  Text _text() {
    return const Text(
      "Hello, World!",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }
}
