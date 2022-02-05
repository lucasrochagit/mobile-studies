class Usuario {
  String? login;
  String? nome;
  String? email;
  String? token;
  List<String>? roles;

  // named constructor
  Usuario.fromJson(Map<String, dynamic> map)
      : nome = map['nome'],
        email = map['email'],
        login = map['login'],
        token = map['token'],
        roles = map['roles']?.map<String>((role) => role.toString()).toList();

  @override
  String toString() {
    return 'Usuario {login: $login, nome: $nome, email: $email, token: $token,' +
        'roles: $roles }';
  }
}
