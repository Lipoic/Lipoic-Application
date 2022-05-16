import 'package:flutter/material.dart';

import 'src/lipoic_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LipoicAPP());
}

class LipoicAPP extends StatelessWidget {
  const LipoicAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lipoic',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        onGenerateInitialRoutes: (String initialRouteName) {
          return [NavigatorUtil.generateRoute(const RouteSettings(name: '/'))];
        },
        onGenerateRoute: (settings) => NavigatorUtil.generateRoute(settings),
        onUnknownRoute: (settings) => NavigatorUtil.generateRoute(settings));
  }
}
