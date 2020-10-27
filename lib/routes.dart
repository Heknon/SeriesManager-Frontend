import 'package:flutter/widgets.dart';
import 'package:seriesmanager_frontend/screens/loading_screen.dart';
import 'package:seriesmanager_frontend/screens/login.dart';
import 'package:seriesmanager_frontend/screens/main/page_container.dart';
import 'package:seriesmanager_frontend/screens/main/shows/show_search.dart';
import 'package:seriesmanager_frontend/services/auth_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext b) => LoginPage(),
  '/loading': (BuildContext b) => LoadingScreen(),
  "/home": (BuildContext b) => PageContainer.defaultImpl(),
  "/search/tv": (BuildContext b) => ShowSearch()
};
