import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:seriesmanager_frontend/bloc/auth/auth_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/Users/Ori/Desktop/SeriesManager/seriesmanager_frontend/lib/services/auth_utils.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  void Function(Change<AuthState>) onChangeState;

  AuthBloc() : super(AuthState(token: null, loggedIn: false, status: 0));

  void setOnStateChange(BuildContext context) {
    onChangeState = (Change<AuthState> auth) {
      if (auth.nextState.loggedIn) {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString("token", auth.nextState.token);
          Navigator.pushReplacementNamed(context, "/home");
        });
      } else if (auth.currentState.loggedIn && !auth.nextState.loggedIn) Navigator.pushReplacementNamed(context, "/");
    };
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    if (onChangeState != null) onChangeState(change);
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
    }
  }
}
