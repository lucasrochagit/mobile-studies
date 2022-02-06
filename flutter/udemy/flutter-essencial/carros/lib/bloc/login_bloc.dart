import 'dart:async';

import 'package:carros/external/login_api.dart';
import 'package:carros/models/api_response.dart';
import 'package:carros/models/usuario.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  Stream<bool> get stream => _streamController.stream;

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    _streamController.add(true);
    ApiResponse<Usuario>? response = await LoginApi.login(login, senha);
    _streamController.add(false);
    return response!;
  }

  void dispose() {
    _streamController.close();
  }
}
