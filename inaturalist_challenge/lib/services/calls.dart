// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import '../models/spider_model.dart';

Map mapResponse = {};
List listOfResults = [];

// class INatCalls {
Future<List> getSpiders() async {
  final http.Response response;

  // BERMUDA SPIDERS 2022 URI
  var url = Uri.parse(
      'https://api.inaturalist.org/v1/observations?photos=true&place_id=8638&year=2022&iconic_taxa=Arachnida&order=desc&order_by=created_at');

  response = await http.get(url);

  // If the server did return a 200 OK response,
  // then parse the JSON
  if (response.statusCode == 200) {
    // setState(() {
    mapResponse = json.decode(response.body);
    // Spider.fromJson(jsonDecode(response.body));
    return listOfResults = mapResponse['results'];
    // return Spider.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Spider information');
  }
}

Future<List> getReptiles() async {
  final http.Response response;

  // BERMUDA SPIDERS 2022 URI
  var url = Uri.parse(
      'https://api.inaturalist.org/v1/observations?photos=true&place_id=8638&year=2022&iconic_taxa=Arachnida&order=desc&order_by=created_at');

  response = await http.get(url);

  // If the server did return a 200 OK response,
  // then parse the JSON
  if (response.statusCode == 200) {
    // setState(() {
    mapResponse = json.decode(response.body);
    // Spider.fromJson(jsonDecode(response.body));
    return listOfResults = mapResponse['results'];
    // return Spider.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Reptile information');
  }
}
// }
