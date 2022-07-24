import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map mapResponse;
  late List listOfResults;

  Future getResponse() async {
    http.Response response;
    // CHANGE THIS CALL TO MORE THAN ONE ID
    // ADD A BUTTON TO SWITCH BETWEEN TYPES OF BUTTONS

    // MARLIN URI
    // var url =
    //     Uri.parse('https://api.inaturalist.org/v1/observations/127458555');
    // BERMUDA SPIDERS 2022 URI
    var url = Uri.parse(
        'https://api.inaturalist.org/v1/observations?photos=true&place_id=8638&year=2022&iconic_taxa=Arachnida&order=desc&order_by=created_at');

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('iNaturalist Code Challenge'),
      ),
      body: mapResponse == null
          ? Container()
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Image.network(listOfResults[0]['default_photo']['url'].toString()),
                    Text(
                      "Spiders Observed in Bermuda in 2022: ${mapResponse['total_results'].toString()}",
                      style: const TextStyle(fontSize: 24),
                    ),

                    //CHANGE THIS TO LIST BUILDER
                    ListView.builder(
                      itemCount: listOfResults.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Image.network(
                              //     listOfResults[index]['images']['url']),
                              Text(
                                "Species: ${listOfResults[index]['species_guess']}",
                              ),
                              Text(
                                "Name: ${listOfResults[index]['taxon']['name']}",
                              ),
                              Text(
                                "Species ID: ${listOfResults[index]['id']}",
                              ),
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
              ),
            ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     get
      //   },
      //   tooltip: 'Results of search',
      //   child: const Icon(Icons.search),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
