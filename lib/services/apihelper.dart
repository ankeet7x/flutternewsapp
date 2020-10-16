import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'newsclass.dart';

class ApiHelper with ChangeNotifier {
  List<News> _news = [];

  List<News> get todos => [..._news];

  fetchNews() async {
    String url =
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-16&sortBy=publishedAt&apiKey=15a3d32b9ee24dd29643f63623df506f';
    final response = await http.get(url);
    var data = json.decode(response.body) as List;
    _news = data.map<News>((json) => News.fromJson(json)).toList();
  }
}
