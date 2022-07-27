import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inaturalist_challenge/services/calls.dart';
import 'package:inaturalist_challenge/views/spider_view.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  Map mapResponse = {};
  List listOfResults = [];

  Future getResponse() async {
    http.Response response;

    // BERMUDA PROJECTS 2022 URI
    var url = Uri.parse(
        'https://api.inaturalist.org/v1/projects?q=bermuda&order_by=recent_posts');

    response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listOfResults = mapResponse['results'];
      });
    }
  }

  @override
  void initState() {
    getResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mapResponse['results'] == null
        ? Container()
        : Scaffold(
            body: Center(
                child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Number of Projects in Bermuda: ${mapResponse['total_results'].toString()}",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  //CHANGE THIS TO LIST BUILDER
                  ListView.builder(
                    itemCount: listOfResults.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                              padding: const EdgeInsets.all(10),
                              // height: 300,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Image.network(
                                  //     listOfResults[index]['header_image_url']),
                                  Text(
                                    "Project Title: ${listOfResults[index]['title']}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Project Description: ${listOfResults[index]['description']}",
                                    style: const TextStyle(fontSize: 16),
                                  ),

                                  // Text(
                                  //   "Species ID: ${listOfResults[index]['id']}",
                                  // ),
                                  // Text(listOfResults[index]['description'])
                                ],
                              ),
                            );
                    },
                  )
                ],
              ),
            )),
          );
  }
}
