import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inaturalist_challenge/services/calls.dart';
import 'package:inaturalist_challenge/views/endemic_view.dart';
import 'package:inaturalist_challenge/views/project_search.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Project View'), actions: [
      //   IconButton(
      //       onPressed: () {
      //         showSearch(context: context, delegate: SearchBar());
      //       },
      //       icon: const Icon(Icons.search))
      // ]),
      body: Container(
        padding: const EdgeInsets.all(15),
        // children: <Widget>[
        //   const Text(
        //     'Projects in Bermuda',
        //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        //   ),
        child: FutureBuilder(
          future: getProjects(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: listOfProjects.length,
              // shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // Image.network(
                      //     listOfProjects[index]['header_image_url']),
                      Text(
                        "Project Title: ${listOfProjects[index]['title']}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Project Description: ${listOfProjects[index]['description']}",
                        style: const TextStyle(fontSize: 16),
                      ),

                      Text(
                        "Observers Count: ${listOfProjects[index]['user_ids'].length}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      // Text(
                      //     "Observation Count: ${listOfProjects[index]['observed_taxa_count']}")
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
