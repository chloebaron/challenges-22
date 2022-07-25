import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:inaturalist_challenge/services/spiders_call.dart';
import 'package:inaturalist_challenge/views/random_view.dart';

// final call = INatCalls();
// late Map mapResponse;
// late List listOfResults;

class ReptileView extends StatefulWidget {
  const ReptileView({Key? key}) : super(key: key);

  @override
  State<ReptileView> createState() => _ReptileViewState();
}

class _ReptileViewState extends State<ReptileView> {
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
    var url = Uri.parse(
        'https://api.inaturalist.org/v1/observations?photos=true&place_id=8638&year=2022&iconic_taxa=Reptilia&quality_grade=research&order=desc&order_by=created_at');

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
      appBar: AppBar(
        title: const Text('Reptiles of Bermuda'),
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Total Observed in 2022: ${mapResponse['total_results'].toString()}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            //CHANGE THIS TO LIST BUILDER
            ListView.builder(
              itemCount: listOfResults.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Image.network(listOfResults[index]['images']['url']),
                      Text(
                        "Common Name: ${listOfResults[index]['species_guess']}",
                      ),
                      Text(
                        "Species Name: ${listOfResults[index]['taxon']['name']}",
                      ),
                      Text(
                        "Species ID: ${listOfResults[index]['id']}",
                      ),
                      Text(
                          "Date Observed ${listOfResults[index]['observed_on_details']['date']}"),
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