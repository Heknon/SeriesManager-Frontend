class AuthEvent {
  const AuthEvent();
}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;
  final bool stayLoggedIn;

  const AuthLoginEvent(this.username, this.password, this.stayLoggedIn) : super();
}