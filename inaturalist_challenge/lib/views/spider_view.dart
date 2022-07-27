import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:inaturalist_challenge/services/calls.dart';

import '../models/spider_model.dart';

class SpiderView extends StatefulWidget {
  const SpiderView({Key? key}) : super(key: key);

  @override
  State<SpiderView> createState() => _SpiderViewState();
}

class _SpiderViewState extends State<SpiderView> {
  // Map mapResponse = {};
  // List listOfResults = [];
  late Future<List> futureSpider;
  // Future getResponse() async {
  //   http.Response response;

  //   var url = Uri.parse(
  //       'https://api.inaturalist.org/v1/observations?photos=true&place_id=8638&year=2022&iconic_taxa=Arachnida&quality_grade=research&order=desc&order_by=created_at');

  //   response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       mapResponse = json.decode(response.body);
  //       listOfResults = mapResponse['results'];
  //     });
  //   }
  // }

  @override
  void initState() {
    setState(() {
      futureSpider = getSpiders();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return mapResponse['results'] == null
        ? Container()
        : Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
          );
  }
}
