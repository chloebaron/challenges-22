import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// late Map mapResponse;
// late List listOfResults;

class INatCalls {
  late Map mapResponse;
  late List listOfResults;

  Future getResponse() async {
    http.Response response;

    // MARLIN URI
    // var url =
    //     Uri.parse('https://api.inaturalist.org/v1/observations/127458555');
    // BERMUDA SPIDERS 2022 URI
    var url = Uri.parse(
        'https://api.inaturalist.org/v1/observations?photos=true&place_id=8638&year=2022&iconic_taxa=Arachnida&order=desc&order_by=created_at');

    response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // if (response.statusCode == 200) {
    //   setState(() {
    mapResponse = json.decode(response.body);
    listOfResults = mapResponse['results'];
    ;
  }
}
