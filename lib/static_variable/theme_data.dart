
import 'package:flutter/material.dart';

class StaticTheme{
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.red,
    accentColor: Colors.amber,
    switchTheme: SwitchThemeData(),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.purple,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith(
            (states) => Colors.amber,
      ),
    ),
  );
}