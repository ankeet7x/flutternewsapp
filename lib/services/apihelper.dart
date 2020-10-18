import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'newsclass.dart';

// class ApiHelper with ChangeNotifier {
//   ApiHelper() {
//     this.fetchNews();
//   }
//   List<News> _news = [];

//   List<News> get news => [..._news];

//   fetchNews() async {
//     String url =
//         'http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-16&sortBy=publishedAt&apiKey=15a3d32b9ee24dd29643f63623df506f';
//     final response = await http.get(url);
//     var data = jsonDecode(response.body) as List;
//     _news = data.map<News>((json) => News.fromJson(json)).toList();
//   }
// }

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
