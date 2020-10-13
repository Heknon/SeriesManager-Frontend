import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primaryColor: Color.fromRGBO(111, 66, 193, 1),
  primaryColorDark: Color.fromRGBO(102, 16, 242, 1),
  primaryColorLight: Color.fromRGBO(102, 70, 242, 1),
  backgroundColor: Color.fromRGBO(25, 21, 30, 1),
  accentColor: Color.fromRGBO(111, 66, 193, 1),
  hoverColor: Colors.white,
  disabledColor: Colors.white,
  
);

class HexColor {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}