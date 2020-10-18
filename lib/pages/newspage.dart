import 'package:flutter/material.dart';
import 'package:flutternews/services/apihelper.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final newsP = Provider.of<ApiHelper>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(newsP.news[newsP.currentIndex].title),
            Text(newsP.news[newsP.currentIndex].author),
            SizedBox(
              height: 10,
            ),
            Text(newsP.news[newsP.currentIndex].description)
          ],
        ),
      ),
    );
  }
}
