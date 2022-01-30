import 'package:flutter/material.dart';
import 'package:flutter_hello/utils/nav.dart';
import 'package:flutter_hello/widgets/black_button.dart';

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
        child: BlackButton(
      "Voltar",
      () => onClickReturn(context),
      buttonColor: Colors.white,
      textColor: Colors.black,
    ));
  }

  onClickReturn(BuildContext context) {
    pop(context, "Page 1");
  }
}
