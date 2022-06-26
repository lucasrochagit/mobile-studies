import 'package:flutter/material.dart';

class ResponsivenessMediaQuery extends StatefulWidget {
  const ResponsivenessMediaQuery({Key? key}) : super(key: key);

  @override
  State<ResponsivenessMediaQuery> createState() =>
      _ResponsivenessMediaQueryState();
}

class _ResponsivenessMediaQueryState extends State<ResponsivenessMediaQuery> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceStatusBarHeight = MediaQuery.of(context).padding.top;
    var deviceAppBarHeight = AppBar().preferredSize.height;

    var deviceWidthItem = deviceWidth / 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsividade"),
      ),
      body: Row(
        children: [
          Container(
            width: deviceWidthItem,
            height: deviceHeight - deviceAppBarHeight - deviceStatusBarHeight,
            color: Colors.red,
            child: Text("Responsividade"),
          ),
          Container(
            width: deviceWidthItem,
            height: deviceHeight - deviceAppBarHeight - deviceStatusBarHeight,
            color: Colors.yellow,
            child: Text("Responsividade"),
          ),
          Container(
            width: deviceWidthItem,
            height: deviceHeight - deviceAppBarHeight - deviceStatusBarHeight,
            color: Colors.green,
            child: Text("Responsividade"),
          )
        ],
      ),
    );
  }
}
