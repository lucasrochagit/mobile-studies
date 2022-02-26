import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hello Camera"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Tire uma foto",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Image.asset("assets/images/camera.png"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickCamera(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _onClickCamera() {
    print("Camera!");
  }
}
