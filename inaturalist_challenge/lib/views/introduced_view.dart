import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inaturalist_challenge/services/calls.dart';

class IntroducedView extends StatefulWidget {
  const IntroducedView({Key? key}) : super(key: key);

  @override
  State<IntroducedView> createState() => _IntroducedViewState();
}

class _IntroducedViewState extends State<IntroducedView> {
  // late Future<List> futureIntroduced;

  // @override
  // void initState() {
  //   setState(() {
  //     // futureIntroduced = getIntroduced();
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return introducedResponse['results'] == null
        ? Container()
        : Scaffold(
            body: Center(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // NavButtons(),
                    const Text(
                      'Introduced Plants Observed in July 2022',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Observation Count: ${introducedResponse['total_results'].toString()}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder(
                        future: getIntroduced(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: listOfIntroduced.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return listOfIntroduced[index]['species_guess'] ==
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
                                          // Image.network(listOfIntroduced[index]['images']['url']),
                                          Text(
                                              "Common Name: ${listOfIntroduced[index]['species_guess']}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "Species Name: ${listOfIntroduced[index]['taxon']['name']}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic)),
                                          Text(
                                              "Species ID: ${listOfIntroduced[index]['id']}",
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                          Text(
                                              "Date Observed ${listOfIntroduced[index]['observed_on_details']['date']}"),
                                        ],
                                      ),
                                    );
                            },
                          );
                        })
                  ],
                ),
              ),
            )),
          );
  }
}
