import 'package:flutter/material.dart';
import 'package:lipoic/src/config/config.dart';
import 'package:lipoic/src/page/pages.dart';

class NavigatorUtil {
  static generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        String? path = settings.name;

        if (path == '/') {
          bool init = appConfig.init;

          if (init) {
            return const MainPage();
          } else {
            return const InitPage();
          }
        } else if (path == '/login') {
          return const LoginPage();
        }

        return const MainPage();
      },
    );
  }
}
