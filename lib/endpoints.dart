import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

final V1 = _V1(1);

class API {
  final baseUrl = (Platform.isAndroid ? "https://10.0.2.2" : "https://localhost") + ":8080";

  final int version;
  String base;
  String login;
  String register;
  String broadcast;
  String detailedBroadcasts;

  API(this.version, {this.login, this.register, this.broadcast, this.detailedBroadcasts}) {
    base = "$baseUrl/api/v$version";
    this.login = base + this.login;
    this.register = base + this.register;
    this.broadcast = base + broadcast;
    this.detailedBroadcasts = base + detailedBroadcasts;
  }

  Future<Map<String, Object>> authenticate(String username, String password, bool stayLoggedIn) async {
    http.Response res = await http.post(V1.login,
        body: jsonEncode({"username": username, "password": password, "stay_logged_in": stayLoggedIn.toString()}),
        headers: {"Content-type": "application/json"});
    Map<String, Object> json = jsonDecode(res.body);
    if (!json.containsKey("token")) return null;
    return json;
  }

  Future<dynamic> accessInformation(String token, String route) async {
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Bearer $token"};
    http.Response res = await http.get(route, headers: headers);
    return jsonDecode(res.body);
  }

  Future<int> getStatusCode(String token, String route) async {
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Bearer $token"};
    http.Response res = await http.get(route, headers: headers);
    return res.statusCode;
  }
}

class _V1 extends API {
  _V1(int version)
      : super(
          version,
          login: "/auth/login",
          register: "/auth/register",
          detailedBroadcasts: "/broadcast/detailed",
          broadcast: "/broadcast",
        );
}
