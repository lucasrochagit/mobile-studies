import 'package:flutter/material.dart';

class ResponsivenessWrap extends StatefulWidget {
  const ResponsivenessWrap({Key? key}) : super(key: key);

  @override
  State<ResponsivenessWrap> createState() => _ResponsivenessWrapState();
}

class _ResponsivenessWrapState extends State<ResponsivenessWrap> {
  @override
  Widget build(BuildContext context) {
    double width = 200;
    double height = 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap'),
      ),
      body: Container(
        color: Colors.black26,
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: [
            Container(
              width: width,
              height: height,
              color: Colors.orange,
            ),
            Container(
              width: width,
              height: height,
              color: Colors.green,
            ),
            Container(
              width: width,
              height: height,
              color: Colors.purple,
            ),
            Container(
              width: width,
              height: height,
              color: Colors.blueGrey,
            ),
            Container(
              width: width,
              height: height,
              color: Colors.red,
            ),
            Container(
              width: width,
              height: height,
              color: Colors.lime,
            ),
          ],
        ),
      ),
    );
  }
}
