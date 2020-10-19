import 'package:flutter/cupertino.dart';

class AuthState {
  final String token;
  final bool loggedIn;
  final int status;

  const AuthState({@required this.token, @required this.loggedIn, @required this.status});

  @override
  String toString() {
    return 'AuthState{token: $token, loggedIn: $loggedIn, status: $status}';
  }
}
