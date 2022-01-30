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

  SingleChildScrollView _body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  Column _buttons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("List View"),
            _button("Page 2"),
            _button("Page 3"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("Snack"),
            _button("Dialog"),
            _button("Toast"),
          ],
        )
      ],
    );
  }

  Image _img(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }

  ElevatedButton _button(String text) {
    return ElevatedButton(
      // onPressed: () => _onClickOk(),
      onPressed: _onClickOk,
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
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
