import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_bloc.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_event.dart';
import 'package:seriesmanager_frontend/screens/login.dart';
import 'package:seriesmanager_frontend/screens/main/page_container.dart';
import 'package:seriesmanager_frontend/services/auth_utils.dart';

class LoadingScreen extends StatelessWidget {
  final Future<String> tokenFuture = getTokenFromSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: isValidToken(tokenFuture),
      builder: (context, snap) {
        if (snap.data == null) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snap.data) {
          BlocProvider.of<AuthBloc>(context).add(AuthTokenUpdateEvent(tokenFuture));
          context.bloc<AuthBloc>().enableBroadcasts(context);
          return PageContainer.defaultImpl();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
