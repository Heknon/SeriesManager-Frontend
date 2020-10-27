import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_event.dart';
import 'package:seriesmanager_frontend/screens/login.dart';
import 'package:seriesmanager_frontend/screens/main/page_container.dart';
import 'package:seriesmanager_frontend/screens/main/shows/shows_container.dart';
import 'package:seriesmanager_frontend/services/auth_utils.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: isValidToken(getTokenFromSharedPreferences()),
      builder: (context, snap) {
        print(snap.data);
        if (snap.data == null) {
          return Test();
        } else if (snap.data) {
          BlocProvider.of<AuthBloc>(context).add(AuthTokenUpdateEvent(getTokenFromSharedPreferences()));
          return PageContainer.defaultImpl();
        } else {
          return LoginPage();
        }
      },
    );
  }
}


class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text("fds")));
  }
}
