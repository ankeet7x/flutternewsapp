import 'package:flutter/material.dart';
import 'package:flutternews/pages/home.dart';
import 'package:flutternews/services/apihelper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiHelper(),
      child: MaterialApp(
        title: "News app",
        home: HomePage(),
      ),
    );
  }
}
