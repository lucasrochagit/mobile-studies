import 'package:flutter/material.dart';
import 'package:flutter_hello/widgets/black_button.dart';

class HelloPage3 extends StatelessWidget {
  const HelloPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hello Page 3"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: BlackButton(
        "Voltar",
          () => onClickReturn(context),
      ),
    );
  }

  onClickReturn(BuildContext context) {
    Navigator.pop(context, "Page 3");
  }
}
