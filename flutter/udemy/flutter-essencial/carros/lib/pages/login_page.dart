import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _textFormField(
            "Login",
            "Digite o login",
          ),
          const SizedBox(height: 10),
          _textFormField(
            "Senha",
            "Digite a senha",
            obscureText: true,
          ),
          const SizedBox(height: 20),
          _button("Login"),
        ],
      ),
    );
  }

  SizedBox _button(String text) {
    return SizedBox(
      height: 46,
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () => {},
        style: TextButton.styleFrom(
          primary: Colors.blue,
        ),
      ),
    );
  }

  _textFormField(String label, String hint, {bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 16,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
