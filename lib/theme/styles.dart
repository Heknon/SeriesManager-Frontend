import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(111, 66, 193, 1);
const primaryColorDark = Color.fromRGBO(102, 16, 242, 1);
const primaryColorLight = Color.fromRGBO(102, 70, 242, 1);

final ThemeData themeData = ThemeData(
  primaryColor: primaryColor,
  primaryColorDark: primaryColorDark,
  primaryColorLight: primaryColorLight,
  backgroundColor: Color.fromRGBO(25, 22, 30, 1),
  accentColor: primaryColor,
  hoverColor: Colors.white,
  disabledColor: Colors.white,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primaryColor,
    selectionColor: primaryColor
  ),
  appBarTheme: AppBarTheme(
    color: Color.fromRGBO(36, 31, 44, 1),
    iconTheme: IconThemeData(
      color: Color.fromRGBO(126, 107, 161, 1)
    )
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Color.fromRGBO(126, 107, 161, 1),
      fontWeight: FontWeight.w600
    )
  ),
  
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