import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/routes.dart';
import 'package:seriesmanager_frontend/services/auth_utils.dart';
import 'package:seriesmanager_frontend/theme/styles.dart';
import 'package:seriesmanager_frontend/utils/http_overrides.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  HttpOverrides.global = AppHttpOverrides();
  runApp(SeriesManager());
}

class SeriesManager extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'SeriesManager',
        theme: themeData,
        initialRoute: "/loading",
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
