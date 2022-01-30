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
        body: _body(context));
  }

  Container _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _img(),
          _button(),
        ],
      ),
    );
  }

  Image _img() {
    return Image.asset("assets/images/dog1.png",
        // width: 300,
        // height: 300,
        fit: BoxFit.cover);
  }

  ElevatedButton _button() {
    return ElevatedButton(
      // onPressed: () => _onClickOk(),
      onPressed: _onClickOk,
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
      ),
      child: const Text(
        "OK",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }

  void _onClickOk() {
    print("Clicou no botão ok");
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
