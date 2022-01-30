import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  const HelloPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hello Page 1"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => onClickReturn(context),
        child: const Text('Voltar'),
      ),
    );
  }

  onClickReturn(BuildContext context) {
    Navigator.pop(context, "Page 1");
  }
}
