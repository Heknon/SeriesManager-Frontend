import 'package:flutter/widgets.dart';
import 'package:seriesmanager_frontend/screens/loading_screen.dart';
import 'package:seriesmanager_frontend/screens/login.dart';
import 'package:seriesmanager_frontend/screens/main/page_container.dart';
import 'package:seriesmanager_frontend/screens/main/shows/show_search.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/login': (BuildContext b) => LoginPage(),
  "/home_load": (BuildContext b) => PageContainer.defaultImplLoad(),
  "/search/tv": (BuildContext b) => ShowSearch(),
  "/loading": (BuildContext b) => LoadingScreen()
};
