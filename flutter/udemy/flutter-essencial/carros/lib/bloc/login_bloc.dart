import 'dart:async';
import 'dart:ffi';

import 'package:carros/bloc/simple_bloc.dart';
import 'package:carros/external/login_api.dart';
import 'package:carros/models/api_response.dart';
import 'package:carros/models/usuario.dart';

class LoginBloc extends BooleanBlock {
  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    add(true);
    ApiResponse<Usuario>? response = await LoginApi.login(login, senha);
    add(false);
    return response!;
  }
}
