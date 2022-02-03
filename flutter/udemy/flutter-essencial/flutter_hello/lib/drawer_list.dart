import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
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
            onTap: () {
              print("Item 1");
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
