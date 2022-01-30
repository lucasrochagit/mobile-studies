import 'package:flutter/material.dart';
import 'package:flutter_hello/models/dog.dart';

class DogPage extends StatelessWidget {
  final Dog dog;

  const DogPage(this.dog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(dog.name),
      ),
      body: Image.asset(
        dog.photo,
      ),
    );
  }
}
