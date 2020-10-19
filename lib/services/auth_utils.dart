import '../endpoints.dart';

Future<Map<String, Object>> authenticateInformation(String username, String password, bool stayLoggedIn) async {
  return V1.authenticate(username, password, stayLoggedIn);
}

Future<bool> isValidToken(String token) async {
  return (await V1.getStatusCode(token, V1.broadcast)) != 500;
}