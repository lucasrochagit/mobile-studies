import 'package:carros/drawer_list.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/widgets/carros_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Carros"),
          bottom: const TabBar(tabs: [
            Tab(text: "Clássicos"),
            Tab(text: "Esportivos"),
            Tab(text: "Luxo"),
          ]),
        ),
        body: const TabBarView(
          children: [
            CarrosListView(
              tipoCarro: TipoCarro.classicos,
            ),
            CarrosListView(
              tipoCarro: TipoCarro.esportivos,
            ),
            CarrosListView(
              tipoCarro: TipoCarro.luxo,
            ),
          ],
        ),
        drawer: const DrawerList(),
      ),
    );
  }
}
