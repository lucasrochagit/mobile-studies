class Usuario {
  String? login;
  String? nome;
  String? email;
  String? token;
  List<String>? roles;

  // named constructor
  Usuario.fromJSON(Map map)
      : nome = map['nome'],
        email = map['email'],
        login = map['login'],
        token = map['token'];

  @override
  String toString() {
    return 'Usuario {login: $login, nome: $nome, email: $email, token: $token }';
  }
}
