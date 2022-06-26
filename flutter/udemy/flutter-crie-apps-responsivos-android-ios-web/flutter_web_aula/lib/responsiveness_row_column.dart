import 'package:flutter/material.dart';

class ResponsivenessRowColumn extends StatefulWidget {
  const ResponsivenessRowColumn({Key? key}) : super(key: key);

  @override
  State<ResponsivenessRowColumn> createState() =>
      _ResponsivenessRowColumnState();
}

class _ResponsivenessRowColumnState extends State<ResponsivenessRowColumn> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsividade"),
      ),
      body: Column(
        children: [
          // Container(
          //   color: Colors.red,
          //   height: 200,
          // ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.pinkAccent,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
