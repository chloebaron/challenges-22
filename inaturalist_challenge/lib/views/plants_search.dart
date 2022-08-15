//declare packages
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/calls.dart';


class PlantsSearch extends StatefulWidget {
  PlantsSearch() : super();

  @override
  PlantsSearchState createState() => PlantsSearchState();
}

class PlantsSearchState extends State<PlantsSearch> {
  List<dynamic> plants = [];
  List<dynamic> finalPlantsList = [];

  @override
  void initState() {
    super.initState();
    getAllPlantsList().then((projectsFromCall) {
      setState(() {
        plants = projectsFromCall;
        finalPlantsList = plants;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Colors.lightGreen,
                  ),
                ),
                suffixIcon: const InkWell(
                  child: Icon(Icons.search, color: Colors.black),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
              onChanged: (string) {
                setState(() {
                  finalPlantsList = plants
                      .where(
                        (search) =>
                            (search['species_guess'].toLowerCase().contains(
                                  string.toLowerCase(),
                                )),
                      )
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: finalPlantsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.eco,
                          size: 30,
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              finalPlantsList[index]['species_guess'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              finalPlantsList[index]['taxon']['name'] ?? "null",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Declare Plant class for json data or parameters of json string/data
// class Plant {
//   String commonName;
//   String latinName;
//   Plant({
//     required this.commonName,
//     required this.latinName,
//   });

//   factory Plant.fromJson(Map<dynamic, dynamic> json) {
//     return Plant(
//         commonName: json['species_guess'], latinName: json['taxon']['name']);
//   }
// }
