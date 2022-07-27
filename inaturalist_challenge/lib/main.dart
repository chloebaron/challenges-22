import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inaturalist_challenge/views/about.dart';
import 'dart:convert';

// import 'package:inaturalist_challenge/widgets/spider_body.dart';
import 'views/endemic_view.dart';
import 'widgets/tab_nav.dart';

void main() {
  runApp(const MaterialApp(
    home: TabNav(),
    debugShowCheckedModeBanner: false,
  ));
}
