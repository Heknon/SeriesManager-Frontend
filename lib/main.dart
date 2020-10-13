import 'package:flutter/material.dart';
import 'package:seriesmanager_frontend/routes.dart';
import 'package:seriesmanager_frontend/theme/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeriesManager',
      theme: themeData,
      initialRoute: '/',
      routes: routes,
    );
  }
}
