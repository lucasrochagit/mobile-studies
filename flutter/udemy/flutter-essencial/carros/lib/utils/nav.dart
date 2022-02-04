import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

void pop(BuildContext context, dynamic result) {
  Navigator.pop(context, result);
}
