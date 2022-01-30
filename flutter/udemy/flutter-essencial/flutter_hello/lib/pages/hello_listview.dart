import 'package:flutter/material.dart';

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
    final List<Image> imgs = [
      _img("assets/images/dog1.png"),
      _img("assets/images/dog2.png"),
      _img("assets/images/dog3.png"),
      _img("assets/images/dog4.png"),
      _img("assets/images/dog5.png"),
    ];

    return ListView.builder(
      itemCount: imgs.length,
      itemExtent: 300,
      itemBuilder: (BuildContext context, int index) {
        return imgs[index];
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
