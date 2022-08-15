//declare packages
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/calls.dart';

class ProjectsSearch extends StatefulWidget {
  ProjectsSearch() : super();

  @override
  ProjectsSearchState createState() => ProjectsSearchState();
}

class ProjectsSearchState extends State<ProjectsSearch> {
  List<dynamic> projects = [];
  List<dynamic> finalProjectsList = [];

  @override
  void initState() {
    super.initState();
    getAllProjectsList().then((projectsFromCall) {
      setState(() {
        projects = projectsFromCall;
        finalProjectsList = projects;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.lightGreen,
                    ),
                  ),
                  suffixIcon: const InkWell(
                    child: Icon(Icons.search, color: Colors.black),
                  ),
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Search ',
                ),
                onChanged: (string) {
                  {
                    setState(() {
                      finalProjectsList = projects
                          .where(
                            (search) => (search['title'].toLowerCase().contains(
                                  string.toLowerCase(),
                                )),
                          )
                          .toList();
                    });
                  }
                  ;
                }),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: finalProjectsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            finalProjectsList[index]['title'],
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            finalProjectsList[index]['description'] ?? "null",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class Project {
//   String title;
//   String description;
//   Project({
//     required this.title,
//     required this.description,
//   });

//   factory Project.fromJson(Map<String, dynamic> json) {
//     return Project(
//       title: json['title'],
//       description: json['description'],
//     );
//   }
// }
