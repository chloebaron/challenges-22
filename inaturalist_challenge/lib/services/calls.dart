// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

import '../models/spider_model.dart';

// Empty variables to store the responses to be used in the views
Map endemicsResponse = {};
List listOfEndemics = [];

Map introducedResponse = {};
List listOfIntroduced = [];

Map projectsResponse = {};
List listOfProjects = [];

// Calls to iNaturalist API to fetch endemic species
// Each call has the same functions with their own code
Future<List> getEndemics() async {
  final http.Response response;

  // Query is Endemic Species observed in 2022, all grades
  var url = Uri.parse(
      'https://api.inaturalist.org/v1/observations?endemic=true&place_id=8638&month=7&year=2022&iconic_taxa=Plantae&order=desc&order_by=created_at');

  response = await http.get(url);

  // If the server did return a 200 OK response,
  // then parse the JSON
  if (response.statusCode == 200) {
    // Stores response in a Map
    endemicsResponse = json.decode(response.body);
    // Stores the 'results' list in a list to be displayed
    return listOfEndemics = endemicsResponse['results'];
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
    introducedResponse = json.decode(response.body);
    return listOfIntroduced = introducedResponse['results'];
  } else {
    throw Exception('Failed to load Reptile information');
  }
}
// }

Future<List> getProjects() async {
  http.Response response;

  // Bermuda based projects
  var url = Uri.parse(
      'https://api.inaturalist.org/v1/projects?q=bermuda&order_by=recent_posts');

  // If the server did return a 200 OK response,
  // then parse the JSON
  response = await http.get(url);

  if (response.statusCode == 200) {
    projectsResponse = json.decode(response.body);
    return listOfProjects = projectsResponse['results'];
  } else {
    throw Exception('Failed to load Reptile information');
  }
}
