import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_event.dart';
import 'package:seriesmanager_frontend/screens/login.dart';
import 'package:seriesmanager_frontend/services/auth_utils.dart';
import 'package:seriesmanager_frontend/services/data_access.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  void Function(Change<AuthState>) onChangeState;
  void Function(Change<AuthState>) _enableBroadcasts;

  AuthBloc() : super(AuthState(token: null, loggedIn: false, status: 0));

  void setOnStateChange(BuildContext context) {
    onChangeState = (Change<AuthState> auth) {
      if (auth.nextState.loggedIn) {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString("token", auth.nextState.token);
          if (context.widget is LoginPage) {
            Navigator.pushReplacementNamed(context, "/home_load");
          }
        });
      } else if (auth.currentState.loggedIn && !auth.nextState.loggedIn) Navigator.pushReplacementNamed(context, "/login");
    };
  }

  void enableBroadcasts(BuildContext context) {
    _enableBroadcasts = (Change<AuthState> auth) {
      loadUserBroadcasts(context, auth.nextState.token);
    };
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    if (onChangeState != null) onChangeState(change);
    if (_enableBroadcasts != null) _enableBroadcasts(change);
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoginEvent) {
      Map<String, Object> json = await authenticateInformation(event.username, event.password, event.stayLoggedIn);
      if (json == null) {
        yield AuthState(token: null, loggedIn: false, status: 404);
        return;
      }
      String token = json["token"];
      int status = json["status"];
      yield AuthState(token: token, loggedIn: status == 200, status: status);
    } else if (event is AuthTokenUpdateEvent) {
      yield AuthState(token: await event.token, loggedIn: true, status: 200);
    }
  }
}
