import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:inaturalist_challenge/widgets/spider_body.dart';
import './views/spider_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}


