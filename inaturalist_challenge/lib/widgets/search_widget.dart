//declare packages
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map searchResponse = {};
List listSearch = [];

class ProjectsSearch extends StatefulWidget {
  ProjectsSearch() : super();

  @override
  ProjectsSearchState createState() => ProjectsSearchState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class ProjectsSearchState extends State<ProjectsSearch> {
  final _debouncer = Debouncer();

  List<dynamic> projects = [];
  List<dynamic> finalProjectsList = [];

  //API call for All Subject List
  // String url = 'https://type.fit/api/quotes';
  String url =
      "https://api.inaturalist.org/v1/projects?q=bermuda&order_by=recent_posts";

  Future<List> getAllProjectsList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // print(response.body);
        List list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<dynamic> parseAgents(String responseBody) {
    searchResponse = json.decode(responseBody);
    return listSearch = searchResponse['results'];
  }

  @override
  void initState() {
    super.initState();
    getAllProjectsList().then((projectsFromCall) {
      setState(() {
        projects = projectsFromCall;
        finalProjectsList = projects;
      });
    });
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //Search Bar to List of typed Subject
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
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
                _debouncer.run(() {
                  setState(() {
                    finalProjectsList = projects
                        .where(
                          (search) => (search['title'].toLowerCase().contains(
                                string.toLowerCase(),
                              )),
                        )
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: finalProjectsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            finalProjectsList[index]['title'],
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            finalProjectsList[index]['description'] ?? "null",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
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

//Declare Project class for json data or parameters of json string/data
class Project {
  String title;
  String description;
  Project({
    required this.title,
    required this.description,
  });

  factory Project.fromJson(Map<dynamic, dynamic> json) {
    return Project(
      title: json['title'],
      description: json['description'],
    );
  }
}
