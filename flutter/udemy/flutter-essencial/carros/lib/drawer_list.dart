import 'package:carros/models/usuario.dart';
import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  UserAccountsDrawerHeader _header(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome ?? "Usuário"),
      accountEmail: Text(user.email ?? "user@mail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.urlFoto ?? ""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Usuario> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder(
              future: future,
              builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
                Usuario? user = snapshot.data;
                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Favoritos"),
              subtitle: const Text("Mais informações"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Ajuda"),
              subtitle: const Text("Mais informações"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    alertLogout(context, () => push(context, LoginPage(), replace: true));
  }
}
