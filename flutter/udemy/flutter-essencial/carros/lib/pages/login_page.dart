import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

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
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _textFormField(
              "Login",
              "Digite o login",
              controller: _tLogin,
              validator: (value) => _validateLogin(value),
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            const SizedBox(height: 10),
            _textFormField(
              "Senha",
              "Digite a senha",
              obscureText: true,
              controller: _tSenha,
              validator: (value) => _validatePassword(value),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              focusNode: _focusSenha,
            ),
            const SizedBox(height: 20),
            _button("Login", _onClickLogin),
          ],
        ),
      ),
    );
  }

  SizedBox _button(String text, VoidCallback onPressed) {
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
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: Colors.blue,
        ),
      ),
    );
  }

  _textFormField(
    String label,
    String hint, {
    bool obscureText = false,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.done,
    FocusNode? focusNode,
    FocusNode? nextFocus,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
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
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
    );
  }

  void _onClickLogin() {
    bool? formOk = _formKey.currentState?.validate();
    if (!formOk!) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;
    print("Login $login, Senha $senha");
  }

  _validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return "Digite o login";
    }
    if (value.length < 3) {
      return "Login precisa ter pelo menos 3 dígitos";
    }
    return null;
  }

  _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Digite a senha";
    }
    if (value.length < 3) {
      return "Senha precisa ter pelo menos 3 números";
    }
    return null;
  }
}
