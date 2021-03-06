import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/bloc/broadcast/user_broadcast_bloc.dart';
import 'package:seriesmanager_frontend/routes.dart';
import 'package:seriesmanager_frontend/screens/loading_screen.dart';
import 'package:seriesmanager_frontend/theme/styles.dart';
import 'package:seriesmanager_frontend/utils/http_overrides.dart';

void main() {
  HttpOverrides.global = AppHttpOverrides();
  runApp(SeriesManager());
}

class SeriesManager extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (ctx) => AuthBloc()), BlocProvider(create: (ctx) => UserBroadcastBloc())],
      child: MaterialApp(
        title: 'SeriesManager',
        theme: themeData,
        home: LoadingScreen(),
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
