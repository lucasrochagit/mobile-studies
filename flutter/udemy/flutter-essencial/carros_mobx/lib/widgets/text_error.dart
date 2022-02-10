import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  final String msg;
  final VoidCallback? onPressed;

  const TextError(this.msg, {Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          msg,
          style: const TextStyle(color: Colors.red, fontSize: 22),
        ),
      ),
    );
  }
}
