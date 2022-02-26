import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();

  XFile? _file;

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
            _file != null
                ? Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(8),
                    child: Image.file(
                      File(_file!.path),
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : Image.asset(
                    "assets/images/camera.png",
                    fit: BoxFit.cover,
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickCamera,
        tooltip: 'Increment',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  _onClickCamera() async {
    print("Camera!");
    var image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      this._file = image;
    });
  }
}
