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

  GridView _body() {
    final List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    // return ListView.builder(
    //   itemCount: dogs.length,
    //   itemExtent: 300,
    //   itemBuilder: (BuildContext context, int index) {
    //     Dog dog = dogs[index];
    //     // return _img(dog.photo);
    //     return Stack(
    //       fit: StackFit.expand,
    //       children: <Widget>[
    //         _img(dog.photo),
    //         Align(
    //             alignment: Alignment.topLeft,
    //             // alignment: Alignment(1, 1),
    //             child: Container(
    //               margin: const EdgeInsets.all(12),
    //               padding: const EdgeInsets.all(8),
    //               decoration: BoxDecoration(
    //                   color: Colors.black45,
    //                   borderRadius: BorderRadius.circular(
    //                     16,
    //                   )),
    //               child: Text(
    //                 dog.name,
    //                 style: const TextStyle(
    //                   fontSize: 26,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ))
    //       ],
    //     );
    //   },
    // );
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: dogs.length,
      // itemExtent: 300,
      itemBuilder: (BuildContext context, int index) {
        Dog dog = dogs[index];
        // return _img(dog.photo);
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dog.photo),
            Align(
                alignment: Alignment.topLeft,
                // alignment: Alignment(1, 1),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(
                        16,
                      )),
                  child: Text(
                    dog.name,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        );
      },
    );
  }

  Image _img(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}
