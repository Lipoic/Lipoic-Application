import 'package:flutter/material.dart';
import 'package:lipoic/src/lipoic_app.dart';
export 'app_text_theme.dart';
export 'app_color_theme.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: MaterialColor(color.purple.value, <int, Color>{
        50: color.cyan,
        100: const Color.fromRGBO(114, 188, 247, 1),
        200: const Color.fromRGBO(127, 214, 245, 1),
        300: const Color.fromRGBO(119, 203, 246, 1),
        400: const Color.fromRGBO(125, 191, 247, 1),
        500: color.purple,
        600: const Color.fromRGBO(130, 109, 214, 1),
        700: const Color.fromRGBO(147, 106, 244, 1),
        800: const Color.fromRGBO(84, 107, 237, 1),
        900: const Color.fromRGBO(181, 76, 255, 1),
      }),
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        subtitle1: TextStyle(fontFamilyFallback: ['Roboto', 'NotoSansTC']),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: color.purple, onPrimary: Colors.white)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppTheme.color.purple, width: 3))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: Colors.white)),
      useMaterial3: true);

  static const AppTextTheme text = AppTextTheme();
  static const AppColorTheme color = AppColorTheme();
}
