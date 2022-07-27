import 'package:flutter/material.dart';
import 'package:inaturalist_challenge/views/project_view.dart';
import 'package:inaturalist_challenge/views/reptile_view.dart';
import 'package:inaturalist_challenge/views/spider_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Home'),
    Tab(text: 'Spiders'),
    Tab(text: 'Reptiles'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iNaturalist Coding Challenge'),
        backgroundColor: Colors.black,
        bottom: TabBar(
          indicatorColor: Colors.lightGreen[600],
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        ProjectView(),
        SpiderView(),
        ReptileView(),
      ]),
    );
  }
}
