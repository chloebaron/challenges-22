// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import '../models/spider_model.dart';

Map endemicsResponse = {};
List listOfEndemics = [];

Map introducedResponse = {};
List listOfIntroduced = [];

Map projectsResponse = {};
List listOfProjects = [];

// class INatCalls {
Future<List> getEndemics() async {
  final http.Response response;

  // Endemic Species observed in 2022, all grades
  var url = Uri.parse(
      'https://api.inaturalist.org/v1/observations?endemic=true&place_id=8638&month=7&year=2022&iconic_taxa=Plantae&order=desc&order_by=created_at');

  response = await http.get(url);

  // If the server did return a 200 OK response,
  // then parse the JSON
  if (response.statusCode == 200) {
    // setState(() {
    endemicsResponse = json.decode(response.body);
    // Spider.fromJson(jsonDecode(response.body));
    return listOfEndemics = endemicsResponse['results'];
    // return Spider.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Spider information');
  }
}

Future<List> getIntroduced() async {
  final http.Response response;

  // Introduced Species Observed in 2022
  var url = Uri.parse(
      'https://api.inaturalist.org/v1/observations?introduced=true&native=false&photos=true&place_id=8638&month=7&year=2022&iconic_taxa=Plantae&quality_grade=research&reviewed=true&order=desc&order_by=created_at');

  response = await http.get(url);

  // If the server did return a 200 OK response,
  // then parse the JSON
  if (response.statusCode == 200) {
    // setState(() {
    introducedResponse = json.decode(response.body);
    // Spider.fromJson(jsonDecode(response.body));
    return listOfIntroduced = introducedResponse['results'];
    // return Spider.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Reptile information');
  }
}
// }

Future<List> getProjects() async {
  http.Response response;

  // BERMUDA PROJECTS 2022 URI
  var url = Uri.parse(
      'https://api.inaturalist.org/v1/projects?q=bermuda&order_by=recent_posts');

  // If the server did return a 200 OK response,
  // then parse the JSON
  response = await http.get(url);

  if (response.statusCode == 200) {
    // setState(() {
    projectsResponse = json.decode(response.body);
    // Spider.fromJson(jsonDecode(response.body));
    return listOfProjects = projectsResponse['results'];
    // return Spider.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Reptile information');
  }
}
