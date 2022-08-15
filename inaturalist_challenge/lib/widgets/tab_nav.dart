import 'package:flutter/material.dart';
import 'package:inaturalist_challenge/services/calls.dart';
import 'package:inaturalist_challenge/views/about.dart';
import 'package:inaturalist_challenge/views/plants_search.dart';
import 'package:inaturalist_challenge/views/project_view.dart';
import 'package:inaturalist_challenge/views/introduced_view.dart';
import 'package:inaturalist_challenge/views/endemic_view.dart';
import 'package:inaturalist_challenge/views/project_search.dart';

class TabNav extends StatefulWidget {
  const TabNav({Key? key}) : super(key: key);
  @override
  State<TabNav> createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> myTabs = <Tab>[
    // Tab(text: 'About'),
    const Tab(text: 'Projects'),
    const Tab(text: 'Introduced'),
    const Tab(text: 'Endemic'),
  ];

  @override
  void initState() {
    getEndemics();
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('iNaturalist Coding Challenge'),
          backgroundColor: Colors.black,
          bottom: TabBar(
            indicator: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.lightGreen[600]),
            controller: _tabController,
            tabs: myTabs,
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          ProjectsSearch(),
          PlantsSearch(),
          EndemicView(),
        ]),
      ),
    );
  }
}
