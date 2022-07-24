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
    var url =
        Uri.parse('https://api.inaturalist.org/v1/observations/127458555');

    response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    setState(() {
      mapResponse = json.decode(response.body);
      listOfResults = mapResponse['results'];
    });
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Results Total: ${mapResponse['total_results'].toString()}",
            ),
            //CHANGE THIS TO LIST BUILDER
            Text(
              "Species: ${listOfResults[0]['species_guess'].toString()}",
            ),
          ],
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
