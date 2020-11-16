import 'package:shared_preferences/shared_preferences.dart';

import '../endpoints.dart';

Future<Map<String, Object>> authenticateInformation(String username, String password, bool stayLoggedIn) async {
  return V1.authenticate(username, password, stayLoggedIn);
}

Future<bool> isValidToken(Future<String> tokenFuture) async {
  String token = await tokenFuture;
  int status = await V1.getStatusCode(token, V1.broadcast);
  return status == 200;
}

Future<String> getTokenFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("token");
}
