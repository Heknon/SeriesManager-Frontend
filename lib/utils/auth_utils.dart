import '../endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, Object>> authenticateInformation(String username, String password, bool stayLoggedIn) async {
  http.Response res = await http.post(V1.login,
      body: jsonEncode({"username": username, "password": password, "stay_logged_in": stayLoggedIn.toString()}),
      headers: {"Content-type": "application/json"});
  Map<String, Object> json = jsonDecode(res.body);
  if (!json.containsKey("token")) return null;
  return json;
}
