import 'package:flutter/material.dart';
import 'package:flutternews/services/apihelper.dart';
import 'package:provider/provider.dart';

import 'newspage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final newsP = Provider.of<ApiHelper>(context);
    // bool gotNews = false;
    // if (newsP.news.length != null){
    //   setState(() {

    //   });
    // }

    return Scaffold(
        appBar: new AppBar(
          title: Text("News"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit_outlined),
          onPressed: () {
            // newsP.fetchNews();
            print(newsP.news.length);
          },
        ),
        body: ListView.builder(
          itemCount: newsP.news.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                onTap: () {
                  print(newsP.news[index].title);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsPage()));
                },
                title: (newsP.news.length != 0)
                    ? Text(newsP.news[index].title)
                    : null,
                subtitle: (newsP.news.length != 0)
                    ? Text(newsP.news[index].title)
                    : null);
          },
        ));
  }
}
