import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "Hello My Friend",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
