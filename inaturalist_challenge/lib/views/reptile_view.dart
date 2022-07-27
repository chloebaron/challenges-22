import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inaturalist_challenge/services/calls.dart';

import 'reptile_view.dart';

class ReptileView extends StatefulWidget {
  const ReptileView({Key? key}) : super(key: key);

  @override
  State<ReptileView> createState() => _ReptileViewState();
}

class _ReptileViewState extends State<ReptileView> {
  late Future<List> futureReptiles;

  @override
  void initState() {
    setState(() {
      futureReptiles = getReptiles();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mapResponse['results'] == null
        ? Container()
        : Scaffold(
            body: Center(
                child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // NavButtons(),
                    Text(
                      "Total Observed in 2022: ${mapResponse['total_results'].toString()}",
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    //CHANGE THIS TO LIST BUILDER
                    ListView.builder(
                      itemCount: listOfResults.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return listOfResults[index]['species_guess'] == null
                            ? Container()
                            : Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                  ],
                ),
              ),
            )),
          );
  }
}
