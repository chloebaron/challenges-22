import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inaturalist_challenge/services/calls.dart';

class EndemicView extends StatefulWidget {
  const EndemicView({Key? key}) : super(key: key);

  @override
  State<EndemicView> createState() => _EndemicViewState();
}

// Stateful widget used

class _EndemicViewState extends State<EndemicView> {
  @override
  Widget build(BuildContext context) {
    // If the response has no data, the screen loads an empty container rather than showing an error
    return endemicsResponse['results'] == null
        ? Container()
        : Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // NavButtons(),
                    const Text(
                      "Endemic Species Observed in July 2022",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Observation Count: ${endemicsResponse['total_results'].toString()}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder(
                        future: getEndemics(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: listOfEndemics.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return listOfEndemics[index]['species_guess'] ==
                                      null
                                  ? Container()
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      // height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          // Image.network(listOfEndemics[index]['images']['url']),
                                          Text(
                                              "Common Name: ${listOfEndemics[index]['species_guess']}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),

                                          Text(
                                              "Species Name: ${listOfEndemics[index]['taxon']['name']}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic)),

                                          Text(
                                              "Species ID: ${listOfEndemics[index]['id']}",
                                              style: const TextStyle(
                                                  fontSize: 16)),

                                          Text(
                                              "Date Observed ${listOfEndemics[index]['observed_on_details']['date']}",
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    );
                            },
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
  }
}
