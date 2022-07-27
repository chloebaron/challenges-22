import 'package:flutter/material.dart';
import 'package:inaturalist_challenge/services/calls.dart';
import 'package:inaturalist_challenge/views/project_view.dart';
import 'package:inaturalist_challenge/views/introduced_view.dart';
import 'package:inaturalist_challenge/views/endemic_view.dart';

class TabNav extends StatefulWidget {
  const TabNav({Key? key}) : super(key: key);
  @override
  State<TabNav> createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Projects'),
    Tab(text: 'Endemic'),
    Tab(text: 'Introduced'),
    // Tab(text: 'Native'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    getEndemics();
    getIntroduced();
    getProjects();
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
        EndemicView(),
        IntroducedView(),
      ]),
    );
  }
}
