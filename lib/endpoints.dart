import 'dart:io';

final V1 = _V1(1);



class API {
  final baseUrl = (Platform.isAndroid ? "https://10.0.2.2" : "https://localhost") + ":8080";

  final int version;
  String base;
  String login;
  String register;

  API(this.version, {this.login, this.register}) {
    base = "$baseUrl/api/v$version";
    this.login = base += this.login;
    this.register = base += this.register;
  }
}

class _V1 extends API {
  _V1(int version) : super(version, login: "/auth/login", register: "/auth/register");
}
