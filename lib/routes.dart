import 'package:flutter/widgets.dart';
import 'package:seriesmanager_frontend/screens/login.dart';
import 'package:seriesmanager_frontend/screens/main/page_container.dart';
import 'package:seriesmanager_frontend/screens/main/shows/show_search.dart';
import 'package:seriesmanager_frontend/screens/main/shows/shows_tab.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home': (BuildContext b) => LoginPage(),
  "/": (BuildContext b) => PageContainer.defaultImpl(),
  "/search/tv": (BuildContext b) => ShowSearch()
};
