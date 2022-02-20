import 'package:carros/drawer_list.dart';
import 'package:carros/external/carros_api.dart';
import 'package:carros/pages/carros_page.dart';
import 'package:carros/pages/favoritos_page.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/prefs.dart';
import 'package:carros/widgets/carros_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  _initTabs() async {
    _tabController = TabController(length: 4, vsync: this);

    int tabIdx = await Prefs.getInt('tabIdx');

    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt('tabIdx', _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Carros"),
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(
            text: "Clássicos",
            icon: Icon(Icons.directions_car),
          ),
          Tab(
            text: "Esportivos",
            icon: Icon(Icons.directions_car),
          ),
          Tab(
            text: "Luxo",
            icon: Icon(Icons.directions_car),
          ),
          Tab(
            text: "Favoritos",
            icon: Icon(Icons.favorite),
          ),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          CarrosPage(tipoCarro: TipoCarro.classicos),
          CarrosPage(tipoCarro: TipoCarro.esportivos),
          CarrosPage(tipoCarro: TipoCarro.luxo),
          FavoritosPage()
        ],
      ),
      drawer: const DrawerList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: _onClickAddCarro,
      ),
    );
  }

  void _onClickAddCarro() {
    alert(context, "Adicionar Carro");
  }
}
