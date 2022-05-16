import 'package:flutter/material.dart';
import 'package:lipoic/src/page/pages.dart';

class NavigatorUtil {
  static generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        if (true) {
          return const InitPage();
        }

        return const MainPage();
      },
    );
  }
}
