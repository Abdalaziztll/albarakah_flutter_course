import 'package:flutter/material.dart';

ThemeData getThemeData({bool isLight = true}) {
  if (isLight) {
    return ThemeData(
      useMaterial3: true,
      // app bar theme config
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      colorSchemeSeed: Colors.pink,

      scaffoldBackgroundColor: Colors.amber,
    );
  } else {
    return ThemeData(
      useMaterial3: true,
      // app bar theme config
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black45,
        centerTitle: true,
      ),
      colorSchemeSeed: Colors.red,

      scaffoldBackgroundColor: Colors.orange,
    );
  }
}
