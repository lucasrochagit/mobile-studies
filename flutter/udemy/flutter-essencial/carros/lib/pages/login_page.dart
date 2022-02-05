import 'package:carros/external/login_api.dart';
import 'package:carros/models/api_response.dart';
import 'package:carros/models/usuario.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
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

  bool _showProgress = false;

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
            AppText(
              "Login",
              "Digite o login",
              controller: _tLogin,
              validator: (value) => _validateLogin(value),
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            const SizedBox(height: 10),
            AppText(
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
            AppButton(
              "Login",
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickLogin() async {
    bool? formOk = _formKey.currentState?.validate();
    if (!formOk!) {
      return;
    }
    String login = _tLogin.text;
    String senha = _tSenha.text;

    setState(() {
      _showProgress = true;
    });

    ApiResponse<Usuario>? response = await LoginApi.login(login, senha);
    if (response!.ok == true) {
      Usuario? user = response.result;
      push(context, const HomePage(), replace: true);
    } else {
      String? msg = response.msg ??
          'Um erro interno occorreu. Tente novamente mais tarde.';
      alert(context, msg);
    }

    setState(() {
      _showProgress = false;
    });
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
