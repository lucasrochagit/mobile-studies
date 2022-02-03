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
          TextFormField(
            style: const TextStyle(
              fontSize: 25,
              color: Colors.blue,
            ),
            decoration: const InputDecoration(
                labelText: "Login",
                labelStyle: TextStyle(
                  fontSize: 16,
                ),
                hintText: "Digite o Login",
                hintStyle: TextStyle(
                  fontSize: 16,
                )),
          ),
          const SizedBox(height: 10),
          TextFormField(
              obscureText: true,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
              decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    fontSize: 16,
                  ),
                  hintText: "Digite a senha",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ))),
          const SizedBox(height: 20),
          SizedBox(
            height: 46,
            child: ElevatedButton(
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              onPressed: () => {},
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
