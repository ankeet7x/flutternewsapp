import 'package:flutter/material.dart';
import 'package:flutternews/services/apihelper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final newsP = Provider.of<ApiHelper>(context);
    return Scaffold(
        appBar: new AppBar(
          title: Text("News"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit_outlined),
          onPressed: () => print(newsP.news.length),
        ),
        body: ListView.builder(
          itemCount: newsP.news.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(newsP.news[index].title),
              subtitle: Text(newsP.news[index].author),
            );
          },
        ));
  }
}
