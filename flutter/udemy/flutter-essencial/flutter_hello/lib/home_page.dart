import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/hello_listview.dart';
import 'package:flutter_hello/pages/hello_page2.dart';
import 'package:flutter_hello/pages/hello_page3.dart';
import 'package:flutter_hello/utils/nav.dart';
import 'package:flutter_hello/widgets/black_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hello Flutter",
        ),
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
    // Column _body(BuildContext context) {
    // return Column(
    //   children: <Widget>[
    //     Expanded(child: _pageView()),
    //     Expanded(child: _pageView()),
    //   ],
    // );
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

  Builder _buttons() {
    return Builder(builder: (BuildContext context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlackButton(
                "ListView",
                () => _onClickNavigator(context, const HelloListView()),
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
              BlackButton("Snack", () => _onClickSnack(context)),
              BlackButton("Dialog", () => _onClickDialog(context)),
              BlackButton("Toast", () => _onClickToast()),
            ],
          )
        ],
      );
    });
  }

  _onClickSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Olá, Flutter'),
        duration: Duration(seconds: 1),
        action: SnackBarAction(
            label: "OK",
            textColor: Colors.yellow,
            onPressed: () {
              print("Ok!");
            }),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        // only click on alert dialog options to close
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false, // does not allow close on back button
            child: AlertDialog(
              title: const Text(
                "Flutter é muito legal!",
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print("Okkk");
                  },
                  child: const Text('Ok'),
                )
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
      msg: "Flutter é muito legal",
      toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.CENTER,
      // timeInSecForIosWeb: 1,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 20.0,
    );
  }

  Image _img(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String? s = await push(context, page);
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
