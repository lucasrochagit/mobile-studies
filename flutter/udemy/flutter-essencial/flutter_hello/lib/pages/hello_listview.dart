import 'package:flutter/material.dart';
import 'package:flutter_hello/models/dog.dart';

class HelloListView extends StatelessWidget {
  const HelloListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "ListView",
          )),
      body: _body(),
    );
  }

  ListView _body() {
    final List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (BuildContext context, int index) {
        Dog dog = dogs[index];
        return _img(dog.photo);
      },
    );

    /*
    return Container(
      child: ListView(
        itemExtent: 350,
        children: imgs,
      ),
    );
    */
  }

  Image _img(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}
