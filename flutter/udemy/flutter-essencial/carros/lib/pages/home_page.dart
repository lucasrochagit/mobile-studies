import 'package:carros/drawer_list.dart';
import 'package:carros/external/carros_api.dart';
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
    _tabController = TabController(length: 3, vsync: this);

    Prefs.getInt('tabIdx').then((value) => {_tabController.index = value});

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
          Tab(text: "Clássicos"),
          Tab(text: "Esportivos"),
          Tab(text: "Luxo"),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
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
    );
  }
}
