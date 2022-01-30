import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/hello_page1.dart';
import 'package:flutter_hello/pages/hello_page2.dart';
import 'package:flutter_hello/pages/hello_page3.dart';
import 'package:flutter_hello/widgets/black_button.dart';

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
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
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

  Column _buttons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlackButton(
              "Page 1",
              () => _onClickNavigator(context, const HelloPage1()),
            ),
            BlackButton(
              "Page 2",
              () => _onClickNavigator(context, const HelloPage2()),
            ),
            BlackButton(
              "Page 3",
              () => _onClickNavigator(context, const HelloPage3()),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlackButton("Snack", () => _onClickSnack()),
            BlackButton("Dialog", () => _onClickDialog()),
            BlackButton("Toast", () => _onClickToast()),
          ],
        )
      ],
    );
  }

  _onClickSnack() {
    print("Snack");
  }

  _onClickDialog() {
    print("Dialog");
  }

  _onClickToast() {
    print("Toast");
  }

  Image _img(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String? s = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
    print("Return from: $s");
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
