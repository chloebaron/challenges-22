import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inaturalist_challenge/services/spiders_call.dart';
import 'package:inaturalist_challenge/views/spider_view.dart';

// final call = INatCalls();
// late Map mapResponse;
// late List listOfResults;

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  late Map mapResponse;
  late List listOfResults;

  @override
  void initState() {
    getResponse();
    super.initState();
  }

  Future getResponse() async {
    http.Response response;
    // CHANGE THIS CALL TO MORE THAN ONE ID
    // ADD A BUTTON TO SWITCH BETWEEN TYPES OF BUTTONS

    // MARLIN URI
    // var url =
    //     Uri.parse('https://api.inaturalist.org/v1/observations/127458555');
    // BERMUDA SPIDERS 2022 URI
    var url =
        Uri.parse('https://api.inaturalist.org/v1/projects?place_id=8638');

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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.water_drop),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SpiderView()))),
      appBar: AppBar(
        title: const Text('iNaturalist Code Challenge'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Number of Projects in Bermuda: ${mapResponse['total_results'].toString()}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      // Image.network(listOfResults[index]['images']['url']),
                      Text(
                        "Project Title: ${listOfResults[index]['title']}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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

            // Text(
            //   "Species: ${listOfResults[0]['species_guess'].toString()}",
            // ),
            // Text(listOfResults[0]['description'])
          ],
        ),
      )),
    );
  }
}
