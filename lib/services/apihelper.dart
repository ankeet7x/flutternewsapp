import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'newsclass.dart';

class ApiHelper extends ChangeNotifier {
  ApiHelper() {
    this.fetchNews();
  }

  int currentIndex;
  List<News> news = [];

  setCurrentIndex(int index) {
    currentIndex = index;
  }

  Future<void> fetchNews() async {
    String url =
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-18&sortBy=publishedAt&apiKey=yourAPIkey';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        News article = News(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          urlToImage: element['urlToImage'],
          content: element['content'],
          publishedDate: DateTime.parse(element['publishedAt']),
        );
        news.add(article);
      });
    }
  }
}
